import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:distrito7_mobile/features/home/infrastructure/mappers/colegio_mapper.dart';

class ColegiosMapper {
  static List<Colegio> fromJsonList(List<dynamic> jsonList) {
    List<Colegio> colegios = [];
    for (var item in jsonList) {
      colegios.add(ColegioMapper.fromJson(item));
    }
    return colegios;
  }
}
