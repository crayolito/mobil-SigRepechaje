import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/helper/widgets_to_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Map<String, Marker>> entryMarkers(
    {required InfoMarkerBloc infoMarkerBloc,
    required Map<String, LatLng> coordenadas,
    required int zoom,
    required InstitutionType institutionType}) async {
  String urlMarker = "";
  switch (institutionType) {
    case InstitutionType.unidadEducativa:
      urlMarker = 'assets/marcadores/marcadorColegio.png';
      break;
    case InstitutionType.centroSalud:
      urlMarker = 'assets/marcadores/marcadorHospital.png';
      break;
    case InstitutionType.centroDeportivo:
      urlMarker = 'assets/marcadores/marcadorDeportivo.png';
      break;
    case InstitutionType.none:
      urlMarker = 'assets/marcadores/marcadorOtro.png';
      break;
    case InstitutionType.centroRecreativo:
      urlMarker = 'assets/marcadores/marcadorRecreativo.png';
      break;
    case InstitutionType.puntoTuristico:
      urlMarker = 'assets/marcadores/marcadorTurismo.png';
      break;
    case InstitutionType.centroPolicial:
      urlMarker = 'assets/marcadores/marcadorPolicia.png';
      break;
    case InstitutionType.zonaVecinal:
      urlMarker = 'assets/marcadores/marcadorOtro.png';
      break;
    case InstitutionType.paradaMicros:
      urlMarker = 'assets/marcadores/marcadorOtro.png';
      break;
    case InstitutionType.nrEmergencias:
    case InstitutionType.oficinaDistrital:
      break;
  }

  Map<String, Marker> auxMapMarkers = {};
  String? lado;
  int iLado = 0;
  Offset? offset;
  for (var coordenada in coordenadas.entries) {
    String nombre = "MODULO COLEGIO NACIONAL FLORIDA";
    iLado++;
    BitmapDescriptor? iconMarker;
    if (iLado == 1) {
      lado = "a";
      offset = const Offset(0.07, 1);
    } else if (iLado == 2) {
      lado = "b";
      offset = const Offset(0.87, 1);
    } else if (iLado == 3) {
      lado = "c";
      offset = const Offset(0.4, 0.95);
    } else if (iLado == 4) {
      lado = "d";
      offset = const Offset(0.45, 0.5);
    }
    iconMarker = await WidgetMarker().getCustomMarker(
        nombre: nombre, lado: lado!, zoom: zoom, urlMarker: urlMarker);

    if (iLado == 4) {
      iLado = 0;
    }
    final marker = Marker(
        anchor: offset!,
        markerId: MarkerId(coordenada.key),
        position: coordenada.value,
        icon: iconMarker,
        onTap: () {
          infoMarkerBloc.add(OnSelectInstitution(
              id: coordenada.key, typeInstitution: institutionType));
          // infoMarkerBloc.add(const OnChangeViewInfo(true));
        });
    auxMapMarkers[coordenada.key] = marker;
  }

  return auxMapMarkers;
}

Future<BitmapDescriptor> getNetworkImageMarker(String urlMarker) async {
  final resp = await Dio().get(
    urlMarker,
    options: Options(responseType: ResponseType.bytes),
  );

  final imageCodec = await instantiateImageCodec(resp.data,
      targetHeight: 120, targetWidth: 120);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}
