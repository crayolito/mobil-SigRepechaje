import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:distrito7_mobile/features/home/domain/datasources/home_datasource.dart';
import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:distrito7_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:distrito7_mobile/features/home/infrastructure/datasources/home_datasource_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({HomeDataSource? dataSource})
      : dataSource = dataSource ?? HomeDatasourceImpl();

  @override
  Future<List<Colegio>> getColegio() async {
    return await dataSource.getColegio();
  }

  @override
  Future<void> registroNroEmergencia(String titulo) async {
    return await dataSource.registroNroEmergencia(titulo);
  }

  @override
  Future<List<RutaGoogleApi>> getRoutesXaY(
      LatLng posicionI,
      LatLng posicionF,
      TipoTransporte tipoTransporte,
      NivelTrafico nivelTrafico,
      bool showAlternativa) async {
    return await dataSource.getRoutesXaY(
        posicionI, posicionF, tipoTransporte, nivelTrafico, showAlternativa);
  }

  @override
  Future<List<RutaGoogleApi>> getRoutePuntosCorte(
      LatLng posicionUsuario,
      List<LatLng> puntosCorte,
      TipoTransporte tipoTransporte,
      NivelTrafico nivelTrafico,
      bool showAlternativa,
      bool statusPurgaPI) async {
    return await dataSource.getRoutePuntosCorte(posicionUsuario, puntosCorte,
        tipoTransporte, nivelTrafico, showAlternativa, statusPurgaPI);
  }
}
