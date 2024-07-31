import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResponsePuntosCorte {
  final List<PuntosInteres> puntosInteres;
  final List<LatLng> coordPuntosCorte;

  ResponsePuntosCorte(
      {required this.puntosInteres, required this.coordPuntosCorte});
}
