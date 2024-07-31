part of 'map_bloc.dart';

class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnInsertMarker extends MapEvent {}

class OnMapInitialControllerMap extends MapEvent {
  final GoogleMapController controllerGoogleMap;
  const OnMapInitialControllerMap(this.controllerGoogleMap);
}

class OnMapControllerCamera extends MapEvent {
  final CameraPosition cameraPosition;
  const OnMapControllerCamera(this.cameraPosition);
}

class OnInitialFigures extends MapEvent {
  const OnInitialFigures();
}

class OnChangedStatusFollowUser extends MapEvent {
  final bool statusFollow;
  const OnChangedStatusFollowUser(this.statusFollow);
}

class OnNewLocationUser extends MapEvent {
  final LatLng newLocation;
  const OnNewLocationUser(this.newLocation);
}

class OnChangedStatusMap extends MapEvent {
  const OnChangedStatusMap();
}

class OnClearMap extends MapEvent {
  const OnClearMap();
}

class OnInsertContentMap extends MapEvent {
  const OnInsertContentMap();
}

// class OnChangeMarkerByZoom extends MapEvent {
//   const OnChangeMarkerByZoom();
// }

class OnRankingMarkerByZoom extends MapEvent {
  final int ranking;
  const OnRankingMarkerByZoom(this.ranking);
}

class OnChangeProcessMap extends MapEvent {
  final bool status;
  const OnChangeProcessMap(this.status);
}

class OnChangeStatusDetailMap extends MapEvent {
  final StatusDetailMap statusDetailMap;
  const OnChangeStatusDetailMap(this.statusDetailMap);
}

// READ : SOLO POR SIG
// NOTE : INICIO
class OnRoutesXaY extends MapEvent {
  final PuntosInteres puntosInteres;
  final LatLng destino;
  const OnRoutesXaY(this.destino, this.puntosInteres);
}

class OnInitPolylineByCodigo extends MapEvent {
  final String codigo;
  const OnInitPolylineByCodigo(this.codigo);
}

class OnInitRouteXaY extends MapEvent {
  final PuntosInteres puntosInteres;
  final LatLng destino;
  const OnInitRouteXaY(this.destino, this.puntosInteres);
}

class OnRoutesMultiPuntosInterest extends MapEvent {
  const OnRoutesMultiPuntosInterest();
}

class OnInitRouteMultiPuntosInterest extends MapEvent {
  final int selectMarcadores;
  const OnInitRouteMultiPuntosInterest(
    this.selectMarcadores,
  );
}



// NOTE : FIN