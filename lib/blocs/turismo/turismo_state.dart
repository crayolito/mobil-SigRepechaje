part of 'turismo_bloc.dart';

enum TipoTransporte { caminar, bicicleta, carro, moto }

enum NivelTrafico { con, sin, optimo }

enum ProcesoCambioRuta { sinProceso, proceso, procesoFinalizado, error }

// ignore: must_be_immutable
class TurismoState extends Equatable {
  List<PuntosInteres> puntosInteresSeleccionado;
  List<PuntosInteres> puntosInteresBackend;
  List<PuntosInteres> puntosInteresCliente;
  List<RutaGoogleApi> rutasGoogleApi;
  final ProcesoCambioRuta procesoCambioRuta;
  PuntosInteres? showPuntoInteres;
  // NOTE : FILTRO DE PUNTOS DE CORTE
  final TipoTransporte tipoTransporte;
  final NivelTrafico tipoTrafico;
  final int tipoRuta;
  final bool showAlternativa;
  final bool modoRutaCarrera;

  TurismoState({
    List<PuntosInteres>? puntosInteresSeleccionado,
    List<PuntosInteres>? puntosInteresBackend,
    List<PuntosInteres>? puntosInteresCliente,
    List<RutaGoogleApi>? rutasGoogleApi,
    this.showPuntoInteres,
    this.procesoCambioRuta = ProcesoCambioRuta.sinProceso,
    this.tipoTransporte = TipoTransporte.carro,
    this.tipoTrafico = NivelTrafico.optimo,
    this.tipoRuta = 0,
    this.showAlternativa = false,
    this.modoRutaCarrera = false,
  })  : puntosInteresSeleccionado = puntosInteresSeleccionado ?? [],
        puntosInteresBackend = puntosInteresBackend ?? [],
        puntosInteresCliente = puntosInteresCliente ?? [],
        rutasGoogleApi = rutasGoogleApi ?? [];

  TurismoState copyWith({
    List<PuntosInteres>? puntosInteresSeleccionado,
    List<PuntosInteres>? puntosInteresBackend,
    List<PuntosInteres>? puntosInteresCliente,
    List<RutaGoogleApi>? rutasGoogleApi,
    PuntosInteres? showPuntoInteres,
    ProcesoCambioRuta? procesoCambioRuta,
    TipoTransporte? tipoTransporte,
    NivelTrafico? tipoTrafico,
    int? tipoRuta,
    bool? showAlternativa,
    bool? modoRutaCarrera,
  }) =>
      TurismoState(
        puntosInteresSeleccionado:
            puntosInteresSeleccionado ?? this.puntosInteresSeleccionado,
        puntosInteresBackend: puntosInteresBackend ?? this.puntosInteresBackend,
        puntosInteresCliente: puntosInteresCliente ?? this.puntosInteresCliente,
        rutasGoogleApi: rutasGoogleApi ?? this.rutasGoogleApi,
        showPuntoInteres: showPuntoInteres ?? this.showPuntoInteres,
        procesoCambioRuta: procesoCambioRuta ?? this.procesoCambioRuta,
        tipoTransporte: tipoTransporte ?? this.tipoTransporte,
        tipoTrafico: tipoTrafico ?? this.tipoTrafico,
        tipoRuta: tipoRuta ?? this.tipoRuta,
        showAlternativa: showAlternativa ?? this.showAlternativa,
        modoRutaCarrera: modoRutaCarrera ?? this.modoRutaCarrera,
      );

  @override
  List<Object?> get props => [
        puntosInteresSeleccionado,
        puntosInteresBackend,
        puntosInteresCliente,
        rutasGoogleApi,
        procesoCambioRuta,
        showPuntoInteres,
        tipoTransporte,
        tipoTrafico,
        tipoRuta,
        showAlternativa,
        modoRutaCarrera,
      ];
}
