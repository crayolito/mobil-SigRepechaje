part of 'turismo_bloc.dart';

class TurismoEvent extends Equatable {
  const TurismoEvent();

  @override
  List<Object> get props => [];
}

class OnSelectPuntoInteres extends TurismoEvent {
  final PuntosInteres puntoInteres;
  const OnSelectPuntoInteres(this.puntoInteres);
}

class OnChangedFiltroRutaCorte extends TurismoEvent {
  final TipoTransporte? tipoTransporte;
  final NivelTrafico? nivelTrafico;
  final int? tipoRuta;
  final bool? showAlternativa;

  const OnChangedFiltroRutaCorte({
    this.tipoTransporte,
    this.nivelTrafico,
    this.tipoRuta,
    this.showAlternativa,
  });
}

class OnChangedRouteSelect extends TurismoEvent {
  final PuntosInteres puntoInteres;
  final int index;
  const OnChangedRouteSelect({
    required this.puntoInteres,
    required this.index,
  });
}

class OnFiltroViewClienteDPC extends TurismoEvent {
  final String filtroViewCliente;
  const OnFiltroViewClienteDPC(this.filtroViewCliente);
}

class OnResetViewClienteDPC extends TurismoEvent {
  const OnResetViewClienteDPC();
}

class OnGetPuntosCorte extends TurismoEvent {
  const OnGetPuntosCorte();
}

class OnChangedRutasGoogleApi extends TurismoEvent {
  final List<RutaGoogleApi> rutasGoogleApi;
  const OnChangedRutasGoogleApi(this.rutasGoogleApi);
}
