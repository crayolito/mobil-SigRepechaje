part of 'permissions_bloc.dart';



class PermissionsState extends Equatable {
  // GPS ESTADO
  final bool isGpsEnabled;
  // PERMISOS DEL GPS
  final bool isGpsPermissionGranted;
  // INTERNET ESTADO
  final bool isInternetEnabled;

  bool get isGpsPermissionAndGpsEnabled =>
      isGpsPermissionGranted && isGpsEnabled;

  const PermissionsState({
    this.isInternetEnabled = false,
    this.isGpsEnabled = false,
    this.isGpsPermissionGranted = false,
  });

  PermissionsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
    bool? isInternetEnabled,
  }) {
    return PermissionsState(
      isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
      isGpsPermissionGranted:
          isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      isInternetEnabled: isInternetEnabled ?? this.isInternetEnabled,
    );
  }

  List<Object?> get props => [
        isGpsEnabled,
        isGpsPermissionGranted,
        isInternetEnabled,
      ];
}
