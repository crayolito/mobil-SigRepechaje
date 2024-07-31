import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class HomeRepository {
  Future<void> registroNroEmergencia(String titulo);
  Future<List<Colegio>> getColegio();
  Future<List<RutaGoogleApi>> getRoutePuntosCorte(
      LatLng posicionUsuario,
      List<LatLng> puntosCorte,
      TipoTransporte tipoTransporte,
      NivelTrafico nivelTrafico,
      bool showAlternativa,
      bool statusPurgaPI);
  Future<List<RutaGoogleApi>> getRoutesXaY(
    LatLng posicionI,
    LatLng posicionF,
    TipoTransporte tipoTransporte,
    NivelTrafico nivelTrafico,
    bool showAlternativa,
  );
}
