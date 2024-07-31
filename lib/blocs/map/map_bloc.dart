import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/helpers/map-helper.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/data/markers-data.dart';
import 'package:distrito7_mobile/data/polygones-data.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:distrito7_mobile/features/home/infrastructure/repostiories/home_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  // READ : SOLO POR SIG
  final TurismoBloc turismoBloc;

  StreamSubscription<LocationState>? locationStateSubscription;
  final homeRepositoryImpl = HomeRepositoryImpl();
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  final LocationBloc locationBloc;
  final InfoMarkerBloc infoMarkerBloc;
  final InstitutionBloc institutionBloc;

  MapBloc({
    // READ : SOLO POR SIG
    required this.turismoBloc,
    required this.locationBloc,
    required this.infoMarkerBloc,
    required this.institutionBloc,
  }) : super(MapState()) {
    on<OnMapInitialControllerMap>(_onInitialControllerMap);
    on<OnInsertContentMap>(_onInsertContentMap);
    on<OnRankingMarkerByZoom>(_onRankingMarkerByZoom);
    on<OnChangeStatusDetailMap>(_onChangeStatusDetailMap);
    on<OnMapControllerCamera>(_onMapControllerCamera);
    on<OnChangedStatusFollowUser>((event, emit) {
      emit(state.copyWith(followUser: event.statusFollow));
    });
    on<OnChangedStatusMap>((event, emit) {
      emit(state.copyWith(isMapInitialized: !state.isMapInitialized));
    });

    on<OnChangeProcessMap>((event, emit) async {
      emit(state.copyWith(processMap: event.status));
    });

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (!state.isMapInitialized) return;
      if (!state.followUser) return;
      if (locationState.lastKnownLocation == null) return;
      moveCameraMyLocation(locationState.lastKnownLocation!);
    });

    // READ : SOLO POR SIG
    // NOTE : INICIO
    on<OnRoutesXaY>((event, emit) async {
      final posicion = await locationBloc.getActualLocation();
      LatLng coordDestino = event.destino;

      List<RutaGoogleApi> difRutas = await homeRepositoryImpl.getRoutesXaY(
          LatLng(posicion.latitude, posicion.longitude),
          coordDestino,
          turismoBloc.state.tipoTransporte,
          turismoBloc.state.tipoTrafico,
          turismoBloc.state.showAlternativa);
      turismoBloc.add(OnChangedRutasGoogleApi(difRutas));
      add(OnInitPolylineByCodigo(difRutas[0].codigoPolilinea));
      add(OnInitRouteXaY(event.destino, event.puntosInteres));
    });

    on<OnInitRouteXaY>((event, emit) async {
      final Map<String, Marker> markers = {};
      final imagenInicioRuta = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721705943/v7lxqc8kkpo0s8jidymm.png");
      final imagenIconoCDeportivo = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706941/cphugdzccvme6af6jvxd.png");
      final imagenIconoCPolicial = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707004/yvkkhconiwel1faya582.png");
      final imagenIconoCRecreativo = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707029/cpgfup9tec4sbussyfon.png");
      final imagenIconoCSalud = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706961/g7wnkuyhrkf1a7dqzpcb.png");
      final imagenIconoPMicros = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706984/pzmji5yfpw8pjkvrqmwy.png");
      final imagenIconoUEducativa = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706918/jh0jhplehn8dmuzxhnhi.png");
      final imagenIconoPTuristico = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707044/usvxlkggdndziv4c9zhf.png");

      BitmapDescriptor icono = BitmapDescriptor.defaultMarker;
      switch (event.puntosInteres.typeInstitution) {
        case InstitutionType.centroDeportivo:
          icono = imagenIconoCDeportivo;
          break;
        case InstitutionType.centroPolicial:
          icono = imagenIconoCPolicial;
          break;
        case InstitutionType.centroRecreativo:
          icono = imagenIconoCRecreativo;
          break;
        case InstitutionType.centroSalud:
          icono = imagenIconoCSalud;
          break;
        case InstitutionType.paradaMicros:
          icono = imagenIconoPMicros;
          break;
        case InstitutionType.unidadEducativa:
          icono = imagenIconoUEducativa;
          break;
        case InstitutionType.puntoTuristico:
          icono = imagenIconoPTuristico;
          break;
        default:
      }

      final posicionSalida = await locationBloc.getActualLocation();
      final Marker markerInicio = Marker(
        markerId: const MarkerId("inicio"),
        position: LatLng(posicionSalida.latitude, posicionSalida.longitude),
        icon: imagenInicioRuta,
      );
      LatLng positionDestino =
          LatLng(posicionSalida.latitude, posicionSalida.longitude);
      if (!turismoBloc.state.modoRutaCarrera) {
        positionDestino = event.destino;
      }

      final Marker markerDestino = Marker(
        markerId: const MarkerId("destino"),
        position: positionDestino,
        icon: icono,
      );

      markers["inicio"] = markerInicio;
      markers["destino"] = markerDestino;
      emit(state.copyWith(markers: markers));
    });

    on<OnInitPolylineByCodigo>((event, emit) async {
      Map<String, Polyline> polilineas = {};
      List<PointLatLng> decodificacionPuntos =
          PolylinePoints().decodePolyline(event.codigo);
      List<LatLng> puntos = decodificacionPuntos
          .map((PointLatLng point) => LatLng(point.latitude, point.longitude))
          .toList();
      final polilineaRuta = Polyline(
        polylineId: const PolylineId("ruta"),
        color: Colors.pinkAccent,
        points: puntos,
        width: 4,
        patterns: [PatternItem.dash(30), PatternItem.gap(20)],
      );
      polilineas["ruta"] = polilineaRuta;
      emit(state.copyWith(polylines: polilineas));
      await orientarYajustarCamara();
    });

    on<OnRoutesMultiPuntosInterest>((event, emit) async {
      final position = await locationBloc.getActualLocation();
      List<RutaGoogleApi> difRutas = [];
      if (turismoBloc.state.puntosInteresSeleccionado.isEmpty) {
        difRutas = await homeRepositoryImpl.getRoutePuntosCorte(
            LatLng(position.latitude, position.longitude),
            turismoBloc.state.puntosInteresBackend
                .map((e) => LatLng(e.latitud, e.longitud))
                .toList(),
            turismoBloc.state.tipoTransporte,
            turismoBloc.state.tipoTrafico,
            turismoBloc.state.showAlternativa,
            true);
      } else {
        difRutas = await homeRepositoryImpl.getRoutePuntosCorte(
            LatLng(position.latitude, position.longitude),
            turismoBloc.state.puntosInteresSeleccionado
                .map((e) => LatLng(e.latitud, e.longitud))
                .toList(),
            turismoBloc.state.tipoTransporte,
            turismoBloc.state.tipoTrafico,
            turismoBloc.state.showAlternativa,
            false);
      }
      turismoBloc.add(OnChangedRutasGoogleApi(difRutas));
      add(OnInitPolylineByCodigo(difRutas[0].codigoPolilinea));
      add(const OnInitRouteMultiPuntosInterest(2));
    });

    on<OnInitRouteMultiPuntosInterest>((event, emit) async {
      Map<String, Marker> currentMarkers = {};
      List<PuntosInteres> puntosInteresUse = [];

      if (turismoBloc.state.puntosInteresSeleccionado.isEmpty) {
        puntosInteresUse = turismoBloc.state.puntosInteresBackend;
      } else {
        puntosInteresUse = turismoBloc.state.puntosInteresSeleccionado;
      }

      PuntosInteres ultimoPuntoInteres = puntosInteresUse.removeLast();

      final posicionSalida = await locationBloc.getActualLocation();
      final imagenInicioRuta = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721742683/adxtigvs7ogksljttxad.png");
      final imagenFinRuta = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721705943/v7lxqc8kkpo0s8jidymm.png");
      final imagenIconoCDeportivo = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706941/cphugdzccvme6af6jvxd.png");
      final imagenIconoCPolicial = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707004/yvkkhconiwel1faya582.png");
      final imagenIconoCRecreativo = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707029/cpgfup9tec4sbussyfon.png");
      final imagenIconoCSalud = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706961/g7wnkuyhrkf1a7dqzpcb.png");
      final imagenIconoPMicros = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706984/pzmji5yfpw8pjkvrqmwy.png");
      final imagenIconoUEducativa = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721706918/jh0jhplehn8dmuzxhnhi.png");
      final imagenIconoPTuristico = await getNetworkImageMarker(
          "https://res.cloudinary.com/da9xsfose/image/upload/v1721707044/usvxlkggdndziv4c9zhf.png");

      final Marker markerInicio = Marker(
        markerId: const MarkerId("inicio"),
        position: LatLng(posicionSalida.latitude, posicionSalida.longitude),
        icon: imagenInicioRuta,
      );

      final Marker markerFin = Marker(
        markerId: const MarkerId("fin"),
        position:
            LatLng(ultimoPuntoInteres.latitud, ultimoPuntoInteres.longitud),
        icon: imagenFinRuta,
      );

      currentMarkers["inicio"] = markerInicio;
      currentMarkers["fin"] = markerFin;

      puntosInteresUse.asMap().forEach((index, puntoInteres) {
        BitmapDescriptor icono = BitmapDescriptor.defaultMarker;
        switch (puntoInteres.typeInstitution) {
          case InstitutionType.centroDeportivo:
            icono = imagenIconoCDeportivo;
            break;
          case InstitutionType.centroPolicial:
            icono = imagenIconoCPolicial;
            break;
          case InstitutionType.centroRecreativo:
            icono = imagenIconoCRecreativo;
            break;
          case InstitutionType.centroSalud:
            icono = imagenIconoCSalud;
            break;
          case InstitutionType.paradaMicros:
            icono = imagenIconoPMicros;
            break;
          case InstitutionType.unidadEducativa:
            icono = imagenIconoUEducativa;
            break;
          case InstitutionType.puntoTuristico:
            icono = imagenIconoPTuristico;
            break;
          default:
        }

        final marker = Marker(
            markerId: MarkerId("PDI$index"),
            position: LatLng(puntoInteres.latitud, puntoInteres.longitud),
            icon: icono,
            onTap: () {
              var puntoInteres = puntosInteresUse[index];
              var i = index;
              turismoBloc.add(OnSelectPuntoInteres(puntoInteres));
              infoMarkerBloc.add(const OnChangeViewInfo(true));
            });
        currentMarkers["PDI$index"] = marker;
      });
      emit(state.copyWith(markers: currentMarkers));
    });

    // NOTE : FIN
  }

  Future<void> _onChangeStatusDetailMap(
      OnChangeStatusDetailMap event, emit) async {
    emit(state.copyWith(statusDetailMap: event.statusDetailMap));
    final Map<String, Polygon> currentPolygons =
        Map<String, Polygon>.from(state.polygons);
    currentPolygons.removeWhere((key, value) => key.contains("PGZV"));
    String baseInit = coordenadasDePruebaZV.keys.first;
    List<LatLng> coordenadas = [];
    Map<String, LatLng> vectorTrabajo = {};
    if (state.statusDetailMap == StatusDetailMap.zonaBarrios) {
      vectorTrabajo = Map<String, LatLng>.from(coordenadasDePruebaZV);
    } else {
      vectorTrabajo = Map<String, LatLng>.from(coordenadasDePruebaUV);
    }
    for (var coordenada in vectorTrabajo.entries) {
      String a = baseInit[baseInit.length - 1];
      String baseAux = coordenada.key;
      String b = baseAux[baseAux.length - 1];
      if (a.contains(b)) {
        coordenadas.add(coordenada.value);
      } else {
        final polygon = Polygon(
          polygonId: PolygonId("PGZV$a"),
          points: coordenadas,
          fillColor: const Color(0xFF231F20).withOpacity(0.2),
          strokeColor: const Color(0xFF44BEED),
          strokeWidth: 2,
        );
        currentPolygons["PGZV$a"] = polygon;
        baseInit = baseAux;
        coordenadas = [];
        coordenadas.add(coordenada.value);
      }
    }
    emit(state.copyWith(polygons: currentPolygons));
  }

  Future<void> _onMapControllerCamera(event, emit) async {
    cameraPosition = event.cameraPosition;
    //RANGO MENORES DE 12
    if ((cameraPosition!.zoom < 12) &&
        (state.statusZoom != 11) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(11));
    }

    //RANGO ENTRE = 12 HASTA 13
    if ((cameraPosition!.zoom >= 12 && cameraPosition!.zoom < 13) &&
        (state.statusZoom != 12) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(12));
    }

    //RANGO ENTRE = 13 HASTA 14
    if ((cameraPosition!.zoom >= 13 && cameraPosition!.zoom < 14) &&
        (state.statusZoom != 13) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(13));
    }

    //RANGO ENTRE = 14 HASTA 15
    if ((cameraPosition!.zoom >= 14 && cameraPosition!.zoom < 15) &&
        (state.statusZoom != 14) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(14));
    }

    //RANGO ENTRE = 15 HASTA 16
    if ((cameraPosition!.zoom >= 15 && cameraPosition!.zoom < 16) &&
        (state.statusZoom != 15) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(15));
    }

    //RANGO ENTRE = 16 HASTA 17
    if ((cameraPosition!.zoom >= 16 && cameraPosition!.zoom < 17) &&
        (state.statusZoom != 16) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(16));
    }

    // MAYOR A 16 PARA ADELANTE
    if ((cameraPosition!.zoom >= 17) &&
        (state.statusZoom != 17) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(17));
    }
  }

  Future<void> _onRankingMarkerByZoom(OnRankingMarkerByZoom event, emit) async {
    emit(state.copyWith(statusZoom: event.ranking.toDouble()));
    // Map<String, LatLng> aux = Map<String, LatLng>.from(
    //     institutionBloc.state.puntosCategoriaSeleccionada);
    // Map<String, Marker> currentMarkers = {};
    // if (institutionBloc.state.institutionType !=
    //         InstitutionType.oficinaDistrital &&
    //     institutionBloc.state.institutionType != InstitutionType.zonaVecinal) {
    //   final modificado =
    //       await SelectMarkerView.selectMarker(aux, event.ranking);
    //   currentMarkers.addAll(await entryMarkers(
    //     institutionType: institutionBloc.state.institutionType,
    //     infoMarkerBloc: infoMarkerBloc,
    //     coordenadas: modificado,
    //     zoom: event.ranking,
    //   ));
    // }

    // emit(state.copyWith(markers: currentMarkers));
  }

  Future<void> _onInsertContentMap(OnInsertContentMap event, emit) async {
    // final currentPolygons = Map<String, Polygon>.from(state.polygons);
    // final Map<String, Polygon> currentPolygons = {};

    final Map<String, Polyline> currentPolyines = {};
    // final currentMarkers = Map<String, Marker>.from(state.markers);
    final Map<String, Marker> currentMarkers = {};
    // POLIGONO BASE D7
    // final currentPolygons = Map<String, Polygon>.from(state.polygons);
    final Map<String, Polygon> currentPolygons = {};

    // // final List<LatLng> aux = coordenadasDePruebaAvenida.values.toList();
    // final polyline = Polyline(
    //     polylineId: const PolylineId("PLD7"),
    //     points: aux,
    //     color: Colors.black,
    //     width: 5,
    //     patterns: [
    //       PatternItem.dash(20),
    //       PatternItem.gap(10),
    //     ]);
    // currentPolyines["Prueba"] = polyline;
    final polygon = Polygon(
      polygonId: const PolygonId("PBLD7"),
      points: coordenadasLimitD7,
      fillColor: const Color(0xFF231F20).withOpacity(0.2),
      strokeColor: const Color(0xFF1B8206),
      strokeWidth: 4,
    );
    currentPolygons["PBLD7"] = polygon;

    // NOTE : inicio -PROYECTO SIG
    // READ : IMAGENES CARGARLAS
    // final imagenInicioRuta= await getNetworkImageMarker("https://res.cloudinary.com/da9xsfose/image/upload/v1721705943/v7lxqc8kkpo0s8jidymm.png");
    final imagenIconoCDeportivo = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721706941/cphugdzccvme6af6jvxd.png");
    final imagenIconoCPolicial = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721707004/yvkkhconiwel1faya582.png");
    final imagenIconoCRecreativo = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721707029/cpgfup9tec4sbussyfon.png");
    final imagenIconoCSalud = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721706961/g7wnkuyhrkf1a7dqzpcb.png");
    final imagenIconoPMicros = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721706984/pzmji5yfpw8pjkvrqmwy.png");
    final imagenIconoUEducativa = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721706918/jh0jhplehn8dmuzxhnhi.png");
    final imagenIconoPTuristico = await getNetworkImageMarker(
        "https://res.cloudinary.com/da9xsfose/image/upload/v1721707044/usvxlkggdndziv4c9zhf.png");

    puntosInterestD7.asMap().forEach((index, puntoInteres) {
      BitmapDescriptor icono = BitmapDescriptor.defaultMarker;
      switch (puntoInteres.typeInstitution) {
        case InstitutionType.centroDeportivo:
          icono = imagenIconoCDeportivo;
          break;
        case InstitutionType.centroPolicial:
          icono = imagenIconoCPolicial;
          break;
        case InstitutionType.centroRecreativo:
          icono = imagenIconoCRecreativo;
          break;
        case InstitutionType.centroSalud:
          icono = imagenIconoCSalud;
          break;
        case InstitutionType.paradaMicros:
          icono = imagenIconoPMicros;
          break;
        case InstitutionType.unidadEducativa:
          icono = imagenIconoUEducativa;
          break;
        case InstitutionType.puntoTuristico:
          icono = imagenIconoPTuristico;
          break;
        default:
      }

      final marker = Marker(
          markerId: MarkerId("PDI$index"),
          position: LatLng(puntoInteres.latitud, puntoInteres.longitud),
          icon: icono,
          onTap: () {
            var puntoInteres = puntosInterestD7[index];
            var i = index;
            turismoBloc.add(OnSelectPuntoInteres(puntoInteres));
            infoMarkerBloc.add(const OnChangeViewInfo(true));
          });
      currentMarkers["PDI$index"] = marker;
    });

    // NOTE : fin - PROYECTO SIG

    // READ : INICIA AQUI - SOLO POR EL PROYECTO DE SIG
    // Map<String, LatLng> auxVectorUso = {};
    // Map<String, LatLng> modificado = {};
    // final Map<String, Polygon> currentPolygons =
    //     Map<String, Polygon>.from(state.polygons);

    // switch (institutionBloc.state.institutionType) {
    //   case InstitutionType.centroDeportivo:
    //   case InstitutionType.centroPolicial:
    //   case InstitutionType.centroRecreativo:
    //   case InstitutionType.centroSalud:
    //   case InstitutionType.puntoTuristico:
    //   case InstitutionType.unidadEducativa:
    //     List<Colegio> unidadesEducativas =
    //         await homeRepositoryImpl.getColegio();
    //     Map<String, LatLng> puntosCategoriaSeleccionada = {};
    //     // Aquí puedes usar tanto 'index' como 'unidadEducativa'
    //     unidadesEducativas.asMap().forEach((index, unidadEducativa) {
    //       puntosCategoriaSeleccionada["UEM$index"] = (LatLng(
    //           double.parse(unidadEducativa.coodenada_y),
    //           double.parse(unidadEducativa.coodenada_x)));
    //       auxVectorUso["UEM$index"] = LatLng(
    //           double.parse(unidadEducativa.coodenada_x),
    //           double.parse(unidadEducativa.coodenada_y));
    //     });
    //     institutionBloc.add(OnChangedUnidadesEducativas(unidadesEducativas));
    //     institutionBloc.add(
    //         OnChangedCoordenadasCategoriaSelect(puntosCategoriaSeleccionada));
    //     break;
    //   case InstitutionType.zonaVecinal:
    //     add(OnChangeStatusDetailMap(state.statusDetailMap));
    //     break;
    //   case InstitutionType.oficinaDistrital:
    //   case InstitutionType.none:
    //   case InstitutionType.nrEmergencias:
    //   default:
    //     break;
    // }
    // // auxVectorUso = Map<String, LatLng>.from(coordenadasDePrueba);
    // modificado = await SelectMarkerView.selectMarker(auxVectorUso, 17);
    // currentMarkers.addAll(await entryMarkers(
    //   institutionType: institutionBloc.state.institutionType,
    //   infoMarkerBloc: infoMarkerBloc,
    //   coordenadas: modificado,
    //   zoom: 17,
    // ));
    // READ : TERMINA AQUI

    emit(state.copyWith(
        markers: currentMarkers,
        polygons: currentPolygons,
        polylines: currentPolyines));
    add(const OnRankingMarkerByZoom(17));
  }

  Future<void> _onInitialControllerMap(
      OnMapInitialControllerMap event, Emitter<MapState> emit) async {
    final currentMarkers = Map<String, Marker>.from(state.markers);
    final currentPolygons = Map<String, Polygon>.from(state.polygons);
    final currentPolyines = Map<String, Polyline>.from(state.polylines);
    mapController = event.controllerGoogleMap;
    // mapController!.setMapStyle(jsonEncode(mapTheme));
    emit(state.reset());
    emit(state.copyWith(
        isMapInitialized: true,
        markers: currentMarkers,
        polygons: currentPolygons,
        polylines: currentPolyines));
  }

  void moveCameraMyLocation(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(newLocation, 17.5);
    mapController!.animateCamera(cameraUpdate);
    add(const OnChangeProcessMap(true));
  }

  void reorientMap() {
    if (mapController != null && cameraPosition != null) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: cameraPosition!.target,
              zoom: cameraPosition!.zoom,
              bearing: 0)));
    }
  }

  Future<void> setBoundsD7() async {
    double minLat = puntoPrincipalesD7[0].latitude;
    double maxLat = puntoPrincipalesD7[0].latitude;
    double minLng = puntoPrincipalesD7[0].longitude;
    double maxLng = puntoPrincipalesD7[0].longitude;

    for (LatLng puntoCoord in puntoPrincipalesD7) {
      minLat = min(minLat, puntoCoord.latitude);
      maxLat = max(maxLat, puntoCoord.latitude);
      minLng = min(minLng, puntoCoord.longitude);
      maxLng = max(maxLng, puntoCoord.longitude);
    }

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    mapController!.animateCamera(cameraUpdate);
  }

  Future<void> orientarYajustarCamara() async {
    Position posicion = await locationBloc.getActualLocation();
    final cameraPositionOrientar = CameraPosition(
        target: LatLng(posicion.latitude, posicion.longitude),
        zoom: 18.5,
        bearing: -35,
        tilt: 90);
    await mapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPositionOrientar));
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    add(const OnChangedStatusMap());
    state.reset();
    return super.close();
  }
}
