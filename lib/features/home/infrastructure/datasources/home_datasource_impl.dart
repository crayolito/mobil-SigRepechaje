import 'package:dio/dio.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:distrito7_mobile/features/home/domain/datasources/home_datasource.dart';
import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:distrito7_mobile/features/home/infrastructure/mappers/colegios_mapper.dart';
import 'package:distrito7_mobile/helper/mapRoute.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeDatasourceImpl extends HomeDataSource {
  final dio = Dio();

  @override
  Future<List<Colegio>> getColegio() async {
    try {
      var response = await dio.request('/unidadeseducativas',
          options: Options(method: 'GET', responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final structureData = ColegiosMapper.fromJsonList(response.data);
        return structureData;
      } else {
        print(response);
        throw Exception(
            'No fue una respuesta 200 o Fue un error a la hora de convertirlo en Objeto');
      }
    } catch (e) {
      print(e);
      throw Exception('Error al obtener los colegios');
    }
  }

  @override
  Future<void> registroNroEmergencia(String titulo) {
    // TODO: implement registroNroEmergencia
    throw UnimplementedError();
  }

  @override
  Future<List<RutaGoogleApi>> getRoutePuntosCorte(
      LatLng posicionUsuario,
      List<LatLng> puntosCorte,
      TipoTransporte tipoTransporte,
      NivelTrafico nivelTrafico,
      bool showAlternativa,
      bool statusPurgaPI) async {
    if (statusPurgaPI) {
      puntosCorte = MapRouterHelpers.filtrarPuntoCorteUtiles(puntosCorte);
    }
    String travelMode = MapRouterHelpers.convertTravelMode(tipoTransporte);
    String routingPreference =
        MapRouterHelpers.convertRoutingPreference(nivelTrafico);
    String puntosIntermedios =
        MapRouterHelpers.puntosIntermedioBody(puntosCorte);
    String origen = '''
    "origin": {
        "location": {
            "latLng": {
                "latitude": ${posicionUsuario.latitude},
                "longitude":  ${posicionUsuario.longitude}
            }
        }
    }
    ''';
    String destino = '''
    "destination": {
        "location": {
            "latLng": {
                "latitude": ${puntosCorte.last.latitude},
                "longitude": ${puntosCorte.last.longitude}
            }
        }
    }
    ''';

    String body = '''
    {
    $origen,
    $destino,
    "intermediates": 
        $puntosIntermedios
    ,
    "polylineQuality": "HIGH_QUALITY",
    "travelMode": "$travelMode",
    "routingPreference": "$routingPreference",
    "trafficModel" : "OPTIMISTIC",
    "computeAlternativeRoutes": $showAlternativa,
    "routeModifiers": {
        "avoidTolls": false,
        "avoidHighways": false,
        "avoidFerries": false,
        "avoidIndoor": false
    }
}
    ''';
    try {
      var response = await dio.post(
          'https://routes.googleapis.com/directions/v2:computeRoutes',
          data: body,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'X-Goog-Api-Key': 'AIzaSyDYq6w1N7meIbXFGd56FrrfoGN4c7U-r2g',
            'X-Goog-FieldMask':
                'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
          }));
      if (response.statusCode == 200) {
        List<RutaGoogleApi> encodedPolylines =
            RutaGoogleApi.fromJson(response.data);
        return encodedPolylines;
      } else {
        // Manejo de errores para códigos de estado distintos de 200
        throw Exception('Failed to load route data');
      }
    } catch (e) {
      // Captura de errores generales
      print('Error fetching route data: $e');
      throw Exception('Error fetching route data: $e');
    }
  }

  @override
  Future<List<RutaGoogleApi>> getRoutesXaY(
      LatLng posicionI,
      LatLng posicionF,
      TipoTransporte tipoTransporte,
      NivelTrafico nivelTrafico,
      bool showAlternativa) async {
    // Convertir el tipo de transporte y nivel de tráfico a los formatos requeridos por la API
    String travelMode = MapRouterHelpers.convertTravelMode(tipoTransporte);
    String routingPreference =
        MapRouterHelpers.convertRoutingPreference(nivelTrafico);

    // Crear las cadenas de origen y destino en formato JSON
    String origen = '''
  "origin": {
      "location": {
          "latLng": {
              "latitude": ${posicionI.latitude},
              "longitude": ${posicionI.longitude}
          }
      }
  }
  ''';
    String destino = '''
  "destination": {
      "location": {
          "latLng": {
              "latitude": ${posicionF.latitude},
              "longitude": ${posicionF.longitude}
          }
      }
  }
  ''';

    // Construir el cuerpo de la solicitud
    String body = '''
  {
  $origen,
  $destino,
  "polylineQuality": "HIGH_QUALITY",
  "travelMode": "$travelMode",
  "routingPreference": "$routingPreference",
  "trafficModel" : "OPTIMISTIC",
  "computeAlternativeRoutes": $showAlternativa,
  "routeModifiers": {
      "avoidTolls": false,
      "avoidHighways": false,
      "avoidFerries": false,
      "avoidIndoor": false
  }
}
  ''';

    // Realizar la solicitud a la API
    try {
      var response = await dio.post(
          'https://routes.googleapis.com/directions/v2:computeRoutes',
          data: body,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'X-Goog-Api-Key': 'AIzaSyDYq6w1N7meIbXFGd56FrrfoGN4c7U-r2g',
            'X-Goog-FieldMask':
                'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
          }));
      if (response.statusCode == 200) {
        List<RutaGoogleApi> encodedPolylines =
            RutaGoogleApi.fromJson(response.data);
        return encodedPolylines;
      } else {
        // Manejo de errores para códigos de estado distintos de 200
        throw Exception('Failed to load route data');
      }
    } catch (e) {
      // Captura de errores generales
      print('Error fetching route data: $e');
      throw Exception('Error fetching route data: $e');
    }
  }
}
