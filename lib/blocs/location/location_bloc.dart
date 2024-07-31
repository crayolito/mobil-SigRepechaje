import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(lastKnownLocation: event.newLocation));
    });
    on<OnStartFollowingUser>(
        (event, emit) => emit(state.copyWith(isFolowingUser: true)));
    on<OnStopFollowingUser>(
        (event, emit) => emit(state.copyWith(isFolowingUser: false)));
  }

  Future<Position> getActualLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  void startFollowingUser() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, no se puede continuar
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados, no se puede continuar
        return Future.error('Los permisos de ubicación están denegados');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Los permisos están denegados permanentemente, no se puede continuar
      return Future.error(
          'Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.');
    }

    // Si llegamos aquí, los permisos están otorgados y podemos continuar
    add(const OnStartFollowingUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
    }, onError: (e) {
      // Manejar error al obtener la ubicación
      print(e);
    });
  }

  Future<void> stopFolowwingUser() async {
    await positionStream!.cancel();
    add(const OnStopFollowingUser());
  }

  @override
  Future<void> close() {
    stopFolowwingUser();
    return super.close();
  }
}
