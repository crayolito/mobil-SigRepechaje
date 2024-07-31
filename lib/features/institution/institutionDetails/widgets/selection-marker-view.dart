import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMarkerView {
  static Future<Map<String, LatLng>> selectMarker(
      Map<String, LatLng> markers, int zoom) async {
    bool entrada = true;
    int contador = 0;
    Map<String, LatLng> markersAux = markers;
    int aux = markersAux.length;
    bool mandaloFinal = true;
    int? distanciaPromedio;
    if (zoom == 11) {
      distanciaPromedio = 1900;
    } else if (zoom == 12) {
      distanciaPromedio = 1600;
    } else if (zoom == 13) {
      distanciaPromedio = 1400;
    } else if (zoom == 14) {
      distanciaPromedio = 1100;
    } else if (zoom == 15) {
      distanciaPromedio = 800;
    } else if (zoom == 16) {
      distanciaPromedio = 500;
    } else if (zoom == 17) {
      distanciaPromedio = 0;
    }

    while (entrada) {
      contador++;
      List<String> keys = markersAux.keys.toList();
      String key = keys[0];
      LatLng aValue = markersAux[key]!;

      for (var i = 1; i < keys.length; i++) {
        String key2 = keys[i];
        LatLng bValue = markersAux[key2]!;
        double distancia = calcularDistancia(aValue, bValue);
        if ((distancia < distanciaPromedio!)) {
          mandaloFinal = false;
          markersAux.remove(key);
          break;
        }
      }
      if (mandaloFinal) {
        markersAux.remove(key);
        markersAux[key] = aValue;
      }
      mandaloFinal = true;
      if (contador == aux) {
        entrada = false;
      }
    }
    return markersAux;
  }

  static calcularDistancia(LatLng start, LatLng end) {
    double distanceInMeters = Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
    return distanceInMeters;
  }
}
