import 'package:distrito7_mobile/features/institution/domain/datasources/institution_datasource.dart';
import 'package:distrito7_mobile/features/institution/domain/repositories/institution_repository.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/datasources/institution_datasource_impl.dart';

class InstitutionRepositoryImpl extends InstitutionRepository {
  final InstitutionDataSource dataSource;

  InstitutionRepositoryImpl({InstitutionDataSource? dataSource})
      : dataSource = dataSource ?? InstitutionDataSourceImpl();

  @override
  Future<String> procesarDenuncia(
      String texto, String imagen, int idUnidadEducativa) async {
    return await dataSource.procesarDenuncia(texto, imagen, idUnidadEducativa);
  }
}
