import 'package:dio/dio.dart';
import 'package:distrito7_mobile/features/institution/domain/datasources/institution_datasource.dart';

class InstitutionDataSourceImpl extends InstitutionDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://distritosiete-nest-0efdb208ce73.herokuapp.com/api',
  ));

  @override
  Future<String> procesarDenuncia(
      String texto, String imagen, int idUnidadEducativa) async {
    try {
      var response = await dio.post('/denuncias',
          data: {
            'texto': texto,
            'imageUrl': imagen,
            'idUnidadEducativa': idUnidadEducativa
          },
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Añadido 201 para incluir la creación exitosa
        return response.toString();
      } else {
        print(response.data);
        throw Exception(
            'Respuesta inesperada del servidor: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error al procesar la denuncia');
    }
  }
}
