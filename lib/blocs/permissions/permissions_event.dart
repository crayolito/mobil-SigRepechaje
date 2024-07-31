part of 'permissions_bloc.dart';

class PermissionsEvent extends Equatable {
  const PermissionsEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GpsAndPermissionEvent extends PermissionsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;
  const GpsAndPermissionEvent({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });
}

class InternetEvent extends PermissionsEvent {
  final bool isInternetEnabled;
  const InternetEvent({
    required this.isInternetEnabled,
  });
}
