import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';

class PuntosInteres {
  String nombre;
  String direccion;
  String uv;
  double latitud;
  double longitud;
  InstitutionType typeInstitution;
  bool select;

  PuntosInteres({
    required this.direccion,
    required this.uv,
    required this.nombre,
    required this.latitud,
    required this.longitud,
    required this.typeInstitution,
    this.select = false,
  });
}

class RutaGoogleApi {
  final int metros;
  final String segundos;
  final String codigoPolilinea;

  RutaGoogleApi(
      {required this.metros,
      required this.segundos,
      required this.codigoPolilinea});

  // MAPEAR RESPUESTA
  static List<RutaGoogleApi> fromJson(Map<String, dynamic> json) {
    var routesList = json['routes'] as List;
    return routesList.map((route) {
      var polyline = route['polyline'] as Map<String, dynamic>;
      return RutaGoogleApi(
        metros: route['distanceMeters'],
        segundos: route['duration'],
        codigoPolilinea: polyline['encodedPolyline'],
      );
    }).toList();
  }
}

List<PuntosInteres> puntosInterestD7 = [
  // Unidad Educativa
  PuntosInteres(
    nombre: 'Unidad Educativa 16 de Julio',
    direccion: 'Calle 8 Este #123',
    uv: 'UV 1',
    latitud: -17.78062177895396,
    longitud: -63.11065331599137,
    typeInstitution: InstitutionType.unidadEducativa,
  ),
  PuntosInteres(
    nombre: 'Unidad Educativa Las Américas',
    direccion: 'Avenida Principal #456',
    uv: 'UV 2',
    latitud: -17.783337304901558,
    longitud: -63.10610139379409,
    typeInstitution: InstitutionType.unidadEducativa,
  ),
  PuntosInteres(
    nombre: 'Unidad Educativa República de Italia',
    direccion: 'Calle Italia #789',
    uv: 'UV 3',
    latitud: -17.78218260813326,
    longitud: -63.116236494889606,
    typeInstitution: InstitutionType.unidadEducativa,
  ),
  PuntosInteres(
    nombre: 'Unidad Educativa Santa Cruz',
    direccion: 'Avenida Bolívar #101',
    uv: 'UV 4',
    latitud: -17.787210478330486,
    longitud: -63.121455430837756,
    typeInstitution: InstitutionType.unidadEducativa,
  ),
  PuntosInteres(
    nombre: 'Unidad Educativa La Salle',
    direccion: 'Calle Lasalle #202',
    uv: 'UV 5',
    latitud: -17.783801050513592,
    longitud: -63.12291203809445,
    typeInstitution: InstitutionType.unidadEducativa,
  ),

  // Centro Recreativo
  PuntosInteres(
    nombre: 'Parque Urbano Central',
    direccion: 'Avenida Parque #303',
    uv: 'UV 6',
    latitud: -17.788655189364526,
    longitud: -63.13504960910002,
    typeInstitution: InstitutionType.centroRecreativo,
  ),
  PuntosInteres(
    nombre: 'Jardín Botánico Municipal',
    direccion: 'Calle Botánica #404',
    uv: 'UV 7',
    latitud: -17.805759680836687,
    longitud: -63.113139497330444,
    typeInstitution: InstitutionType.centroRecreativo,
  ),
  PuntosInteres(
    nombre: 'Centro Cultural de Santa Cruz',
    direccion: 'Avenida Cultura #505',
    uv: 'UV 8',
    latitud: -17.794896187408636,
    longitud: -63.12187998922096,
    typeInstitution: InstitutionType.centroRecreativo,
  ),
  PuntosInteres(
    nombre: 'Museo de Historia Natural',
    direccion: 'Calle Museo #606',
    uv: 'UV 9',
    latitud: -17.792180031429094,
    longitud: -63.13887319001411,
    typeInstitution: InstitutionType.centroRecreativo,
  ),
  PuntosInteres(
    nombre: 'Centro de Interpretación Ambiental',
    direccion: 'Avenida Ambiente #707',
    uv: 'UV 10',
    latitud: -17.789984056797017,
    longitud: -63.13984410810864,
    typeInstitution: InstitutionType.centroRecreativo,
  ),

  // Centro de Salud
  PuntosInteres(
    nombre: 'Centro de Salud Villa 1ro de Mayo',
    direccion: 'Calle Salud #808',
    uv: 'UV 11',
    latitud: -17.790099843655902,
    longitud: -63.135777925184364,
    typeInstitution: InstitutionType.centroSalud,
  ),
  PuntosInteres(
    nombre: 'Hospital Municipal de Niños',
    direccion: 'Avenida Hospital #909',
    uv: 'UV 12',
    latitud: -17.7946649636578,
    longitud: -63.13711328996779,
    typeInstitution: InstitutionType.centroSalud,
  ),
  PuntosInteres(
    nombre: 'Clínica San Rafael',
    direccion: 'Calle Rafael #1010',
    uv: 'UV 13',
    latitud: -17.800617144078277,
    longitud: -63.132925786481756,
    typeInstitution: InstitutionType.centroSalud,
  ),
  PuntosInteres(
    nombre: 'Centro de Salud La Morita',
    direccion: 'Avenida Morita #1111',
    uv: 'UV 14',
    latitud: -17.801426191974667,
    longitud: -63.12618892786068,
    typeInstitution: InstitutionType.centroSalud,
  ),
  PuntosInteres(
    nombre: 'Policlínico Santa Cruz',
    direccion: 'Calle Cruz #1212',
    uv: 'UV 15',
    latitud: -17.801483605389727,
    longitud: -63.11593180980092,
    typeInstitution: InstitutionType.centroSalud,
  ),

  // Centro Deportivo
  PuntosInteres(
    nombre: 'Polideportivo La Villa',
    direccion: 'Avenida Deporte #1313',
    uv: 'UV 16',
    latitud: -17.80194551853505,
    longitud: -63.110712072431696,
    typeInstitution: InstitutionType.centroDeportivo,
  ),
  PuntosInteres(
    nombre: 'Gimnasio Municipal',
    direccion: 'Calle Gimnasio #1414',
    uv: 'UV 17',
    latitud: -17.797496263863348,
    longitud: -63.11538586632832,
    typeInstitution: InstitutionType.centroDeportivo,
  ),
  PuntosInteres(
    nombre: 'Club Deportivo Santa Cruz',
    direccion: 'Avenida Club #1515',
    uv: 'UV 18',
    latitud: -17.79489534814684,
    longitud: -63.10955962215885,
    typeInstitution: InstitutionType.centroDeportivo,
  ),
  PuntosInteres(
    nombre: 'Centro Acuático Villa',
    direccion: 'Calle Acuática #1616',
    uv: 'UV 19',
    latitud: -17.789462757374373,
    longitud: -63.10500829101217,
    typeInstitution: InstitutionType.centroDeportivo,
  ),
  PuntosInteres(
    nombre: 'Estadio Olímpico Villa 1ro de Mayo',
    direccion: 'Avenida Olímpica #1717',
    uv: 'UV 20',
    latitud: -17.79443256155989,
    longitud: -63.10525046545992,
    typeInstitution: InstitutionType.centroDeportivo,
  ),

  // Punto Turístico
  PuntosInteres(
    nombre: 'Plaza 24 de Septiembre',
    direccion: 'Calle Plaza #1818',
    uv: 'UV 21',
    latitud: -17.795762912120093,
    longitud: -63.13717403169554,
    typeInstitution: InstitutionType.puntoTuristico,
  ),
  PuntosInteres(
    nombre: 'Catedral Metropolitana',
    direccion: 'Avenida Catedral #1919',
    uv: 'UV 22',
    latitud: -17.794549083541924,
    longitud: -63.14227202245726,
    typeInstitution: InstitutionType.puntoTuristico,
  ),
  PuntosInteres(
    nombre: 'Parque El Arenal',
    direccion: 'Calle Arenal #2020',
    uv: 'UV 23',
    latitud: -17.795936168569884,
    longitud: -63.11787433417748,
    typeInstitution: InstitutionType.puntoTuristico,
  ),
  PuntosInteres(
    nombre: 'Zoológico Municipal',
    direccion: 'Avenida Zoológico #2121',
    uv: 'UV 24',
    latitud: -17.807030399204383,
    longitud: -63.10597713947047,
    typeInstitution: InstitutionType.puntoTuristico,
  ),
  PuntosInteres(
    nombre: 'Fexpocruz',
    direccion: 'Calle Feria #2222',
    uv: 'UV 25',
    latitud: -17.804430573109347,
    longitud: -63.14391155954261,
    typeInstitution: InstitutionType.puntoTuristico,
  ),

  // Centro Policial
  PuntosInteres(
    nombre: 'Estación Policial Villa 1ro de Mayo',
    direccion: 'Avenida Policial #2323',
    uv: 'UV 26',
    latitud: -17.810151961944882,
    longitud: -63.135353884496986,
    typeInstitution: InstitutionType.centroPolicial,
  ),
  PuntosInteres(
    nombre: 'Subestación Policial La Villa',
    direccion: 'Calle Policía #2424',
    uv: 'UV 27',
    latitud: -17.80893849030248,
    longitud: -63.13237974899312,
    typeInstitution: InstitutionType.centroPolicial,
  ),
  PuntosInteres(
    nombre: 'Centro de Investigaciones Policiales',
    direccion: 'Avenida Investigaciones #2525',
    uv: 'UV 28',
    latitud: -17.811596723752125,
    longitud: -63.124732062211514,
    typeInstitution: InstitutionType.centroPolicial,
  ),
  PuntosInteres(
    nombre: 'Unidad de Tránsito Villa',
    direccion: 'Calle Tránsito #2626',
    uv: 'UV 29',
    latitud: -17.811423193757097,
    longitud: -63.1188444907876,
    typeInstitution: InstitutionType.centroPolicial,
  ),
  PuntosInteres(
    nombre: 'Base Policial Santa Cruz',
    direccion: 'Avenida Base #2727',
    uv: 'UV 30',
    latitud: -17.811943088681385,
    longitud: -63.11477772944656,
    typeInstitution: InstitutionType.centroPolicial,
  ),

  // Parada de Micros
  PuntosInteres(
    nombre: 'Parada de Micros 1',
    direccion: 'Calle Micros #2828',
    uv: 'UV 31',
    latitud: -17.80471949286183,
    longitud: -63.11295750989228,
    typeInstitution: InstitutionType.paradaMicros,
  ),
  PuntosInteres(
    nombre: 'Parada de Micros 2',
    direccion: 'Avenida Micros #2929',
    uv: 'UV 32',
    latitud: -17.795820471895127,
    longitud: -63.14124035649775,
    typeInstitution: InstitutionType.paradaMicros,
  ),
  PuntosInteres(
    nombre: 'Parada de Micros 3',
    direccion: 'Calle Micros 3 #3030',
    uv: 'UV 33',
    latitud: -17.791601877052603,
    longitud: -63.143000098339975,
    typeInstitution: InstitutionType.paradaMicros,
  ),
  PuntosInteres(
    nombre: 'Parada de Micros 4',
    direccion: 'Avenida Micros 4 #3131',
    uv: 'UV 34',
    latitud: -17.792177983246308,
    longitud: -63.099363441033674,
    typeInstitution: InstitutionType.paradaMicros,
  ),
  PuntosInteres(
    nombre: 'Parada de Micros 5',
    direccion: 'Calle Micros 5 #3232',
    uv: 'UV 35',
    latitud: -17.796570097703555,
    longitud: -63.10063737577647,
    typeInstitution: InstitutionType.paradaMicros,
  ),
];
