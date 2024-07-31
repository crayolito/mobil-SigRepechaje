import 'package:distrito7_mobile/blocs/map/map_bloc.dart';

class TerrainMap {
  int clave;
  String titulo;
  String image;
  StatusDetailMap statusMap;

  TerrainMap({
    required this.clave,
    required this.titulo,
    required this.image,
    required this.statusMap,
  });
}
