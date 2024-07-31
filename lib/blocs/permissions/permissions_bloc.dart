import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/permissions/helpers.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  StreamSubscription? gpsServiceSubscription;
  StreamSubscription<ConnectionStatus>? internetSubscription;
  PermissionsBloc() : super(const PermissionsState()) {
    // PERMISO DEL GPS
    on<GpsAndPermissionEvent>((event, emit) {
      emit(state.copyWith(
          isGpsEnabled: event.isGpsEnabled,
          isGpsPermissionGranted: event.isGpsPermissionGranted));
    });
    on<InternetEvent>((event, emit) {
      emit(state.copyWith(isInternetEnabled: event.isInternetEnabled));
    });

    internetChecker.internetStatus().listen((event) {
      if (ConnectionStatus.online == event) {
        add(const InternetEvent(isInternetEnabled: true));
      } else {
        add(const InternetEvent(isInternetEnabled: false));
      }
    });
    _init();
  }

  Future<void> _init() async {
    final gpsInitStatus =
        await Future.wait([_checkGpsStatus(), _isPermissionGranted()]);

    add(GpsAndPermissionEvent(
        isGpsEnabled: gpsInitStatus[0],
        isGpsPermissionGranted: gpsInitStatus[1]));
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      add(GpsAndPermissionEvent(
          isGpsEnabled: isEnabled,
          isGpsPermissionGranted: state.isGpsPermissionGranted));
    });

    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();

    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: true));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: true));
        openAppSettings();
        break;
    }
  }

  @override
  Future<void> close() {
    gpsServiceSubscription!.cancel();
    internetSubscription!.cancel();
    return super.close();
  }
}
