import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';

class ColegioMapper {
  static Colegio fromJson(Map<String, dynamic> json) {
    return Colegio(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      coodenada_x: json['coordenada_x'] ?? '',
      coodenada_y: json['coordenada_y'] ?? '',
      direccion: json['direccion'] ?? '',
      historia: json['historia'] ?? '',
      video: json['video'] ?? '',
      slug: json['slug'] ?? '',
      fotos: (json['fotos'] as List<dynamic>?)
              ?.map((foto) => Foto.fromJson(foto))
              .toList() ??
          [],
      infraestructura: json['idInfraestructura'] != null
          ? Infraestructura.fromJson(json['idInfraestructura'])
          : Infraestructura.vacio(),
      tipoColegio: json['idTipoColegio'] != null
          ? TipoColegio.fromJson(json['idTipoColegio'])
          : TipoColegio.vacio(),
      turno: json['idTurno'] != null
          ? Turno.fromJson(json['idTurno'])
          : Turno.vacio(),
      gestion: json['idGestion'] != null
          ? Gestion.fromJson(json['idGestion'])
          : Gestion.vacio(),
      apoyosocial: (json['apoyosSociales'] as List<dynamic>?)
              ?.map((apoyo) => ApoyoSocial.fromJson(apoyo))
              .toList() ??
          [],
      apoyogubernamental: (json['apoyosGubernamentales'] as List<dynamic>?)
              ?.map((apoyo) => ApoyoGubernamental.fromJson(apoyo))
              .toList() ??
          [],
      desayunos: (json['desayunos'] as List<dynamic>?)
              ?.map((desayuno) => Desayuno.fromJson(desayuno))
              .toList() ??
          [],
    );
  }
}
