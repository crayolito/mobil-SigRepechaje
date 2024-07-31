part of 'location_bloc.dart';

class LocationState extends Equatable {
  // Empezar a seguir al usuario
  final bool isFolowingUser;

  //Ultima ubicacion del usuario
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHisyory;

  const LocationState(
      {this.isFolowingUser = false, this.lastKnownLocation, myLocationHisyory})
      : myLocationHisyory = myLocationHisyory ?? const [];

  LocationState copyWith({
    bool? isFolowingUser,
    LatLng? lastKnownLocation,
    List<LatLng>? myLocationHisyory,
  }) =>
      LocationState(
        isFolowingUser: isFolowingUser ?? this.isFolowingUser,
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHisyory: myLocationHisyory ?? this.myLocationHisyory,
      );

  @override
  List<Object?> get props =>
      [isFolowingUser, lastKnownLocation, myLocationHisyory];
}
