part of 'institution_bloc.dart';

enum InstitutionType {
  unidadEducativa,
  centroRecreativo,
  centroSalud,
  centroDeportivo,
  puntoTuristico,
  centroPolicial,
  zonaVecinal,
  paradaMicros,
  none,
  oficinaDistrital,
  nrEmergencias
}

class InstitutionState extends Equatable {
  Map<String, LatLng> puntosCategoriaSeleccionada;
  final List<Colegio> unidadesEducativas;
  // PERMITIR O NO ACCESO INFO EN LOS MARCADORES DEL MAPA
  // final bool isPermitInfo;

  // Search Institution InfoWindow
  final String titulo;

  // Institution Comun
  final bool isInstComun;
  // Institution Especial
  final bool isInstEspecial;

  //
  // Informacion General de la Institucion
  final List<String> infoGeneral;
  final int checkInitInfo;
  final List<OptionsInfo> optionsInfo;
  final List<MantemientoInfraestructura> mantenimiento;
  final List<SuministroGubernamental> suministros;
  final List<VisitaGubernamental> visita;
  final List<DesayunoEscolar> desayuno;

  // Institucions Administrativa de la Institucion
  final int checkInitAdm;
  final List<OptionsInfo> optionsAdm;

  //
  final List<OptionAditional> opcionesAdicionales;
  //
  final InstitutionType institutionType;

  InstitutionState({
    Map<String, LatLng>? puntosCategoriaSeleccionada,
    this.isInstComun = false,
    this.isInstEspecial = false,
    this.institutionType = InstitutionType.none,
    this.titulo = '',
    List<Colegio>? unidadesEducativas,

    ///
    this.checkInitInfo = 0,
    List<String>? infoGeneral,
    List<OptionsInfo>? optionsInfo,
    List<MantemientoInfraestructura>? mantenimiento,
    List<SuministroGubernamental>? suministros,
    List<VisitaGubernamental>? visita,
    List<DesayunoEscolar>? desayuno,

    ///
    List<OptionAditional>? opcionesAdicionales,

    ///
    this.checkInitAdm = 0,
    List<OptionsInfo>? optionsAdm,
  })  : infoGeneral = infoGeneral ?? [],
        optionsInfo = optionsInfo ?? [],
        unidadesEducativas = unidadesEducativas ?? [],
        optionsAdm = optionsAdm ?? [],
        mantenimiento = mantenimiento ?? [],
        opcionesAdicionales = opcionesAdicionales ?? [],
        suministros = suministros ?? [],
        visita = visita ?? [],
        desayuno = desayuno ?? [],
        puntosCategoriaSeleccionada = puntosCategoriaSeleccionada ?? {};

  InstitutionState copyWith({
    Map<String, LatLng>? puntosCategoriaSeleccionada,
    bool? isInstComun,
    bool? isInstEspecial,
    //
    List<Colegio>? unidadesEducativas,
    //
    InstitutionType? institutionType,
    String? titulo,
    //
    int? checkInitInfo,
    List<String>? infoGeneral,
    List<OptionsInfo>? optionsInfo,
    List<MantemientoInfraestructura>? mantenimiento,
    List<SuministroGubernamental>? suministros,
    List<VisitaGubernamental>? visita,
    List<DesayunoEscolar>? desayuno,

    ///
    List<OptionAditional>? opcionesAdicionales,
    //
    int? checkInitAdm,
    List<OptionsInfo>? optionsAdm,
  }) =>
      InstitutionState(
        puntosCategoriaSeleccionada:
            puntosCategoriaSeleccionada ?? this.puntosCategoriaSeleccionada,

        isInstComun: isInstComun ?? this.isInstComun,
        isInstEspecial: isInstEspecial ?? this.isInstEspecial,
        //
        unidadesEducativas: unidadesEducativas ?? this.unidadesEducativas,
        //
        institutionType: institutionType ?? this.institutionType,
        titulo: titulo ?? this.titulo,
        //
        checkInitInfo: checkInitInfo ?? this.checkInitInfo,
        optionsInfo: optionsInfo ?? this.optionsInfo,
        infoGeneral: infoGeneral ?? this.infoGeneral,
        mantenimiento: mantenimiento ?? this.mantenimiento,
        suministros: suministros ?? this.suministros,
        visita: visita ?? this.visita,
        desayuno: desayuno ?? this.desayuno,

        ///
        opcionesAdicionales: opcionesAdicionales ?? this.opcionesAdicionales,
        //
        checkInitAdm: checkInitAdm ?? this.checkInitAdm,
        optionsAdm: optionsAdm ?? this.optionsAdm,
      );

  @override
  List<Object?> get props => [
        puntosCategoriaSeleccionada,

        isInstComun,
        isInstEspecial,
        //
        unidadesEducativas,
        //
        institutionType,
        titulo,
        //
        checkInitInfo,
        optionsInfo,
        infoGeneral,
        mantenimiento,
        suministros,
        visita,
        desayuno,
        //
        opcionesAdicionales,
        //
        checkInitAdm,
        optionsAdm
      ];
}
