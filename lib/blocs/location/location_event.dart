part of 'location_bloc.dart';

class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnNewUserLocationEvent extends LocationEvent {
  final LatLng newLocation;
  const OnNewUserLocationEvent(this.newLocation);
}

class OnStartFollowingUser extends LocationEvent {
  const OnStartFollowingUser();
}

class OnStopFollowingUser extends LocationEvent {
  const OnStopFollowingUser();
}
