part of 'map_bloc.dart';

enum MapStatus { loaded, processing, error }

enum StatusDetailMap { zonaUV, zonaBarrios }

// ignore: must_be_immutable
class MapState extends Equatable {
  // CONTROL DEL ZOOM
  final double statusZoom;

  //
  final bool processMap;
  final bool isMapInitialized;
  final bool followUser;

  //
  Map<String, Polyline> polylines;
  Map<String, Marker> markers;
  Map<String, Polygon> polygons;
  final MapStatus statusMap;

  //
  final StatusDetailMap statusDetailMap;

  MapState({
    //
    this.statusZoom = 17,
    this.processMap = true,
    //
    this.isMapInitialized = false,
    this.statusMap = MapStatus.loaded,
    this.followUser = false,
    //
    Map<String, Marker>? markers,
    Map<String, Polyline>? polylines,
    Map<String, Polygon>? polygons,
    //
    this.statusDetailMap = StatusDetailMap.zonaUV,
  })  : markers = markers ?? {},
        polylines = polylines ?? {},
        polygons = polygons ?? {};

  MapState copyWith(
          {double? statusZoom,
          bool? processMap,
          bool? banderaZoom,
          bool? isMapInitialized,
          bool? followUser,
          Map<String, Marker>? markers,
          Map<String, Polyline>? polylines,
          Map<String, Polygon>? polygons,
          MapStatus? statusMap,
          StatusDetailMap? statusDetailMap}) =>
      MapState(
        statusDetailMap: statusDetailMap ?? this.statusDetailMap,
        processMap: processMap ?? this.processMap,
        statusZoom: statusZoom ?? this.statusZoom,
        statusMap: statusMap ?? this.statusMap,
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        followUser: followUser ?? this.followUser,
        markers: markers ?? this.markers,
        polylines: polylines ?? this.polylines,
        polygons: polygons ?? this.polygons,
      );

  MapState reset() {
    return MapState(
      statusDetailMap: StatusDetailMap.zonaUV,
      statusZoom: 17,
      processMap: true,
      isMapInitialized: false,
      statusMap: MapStatus.loaded,
      followUser: false,
      markers: const {},
      polylines: const {},
      polygons: const {},
    );
  }

  @override
  List<Object> get props => [
        statusDetailMap,
        isMapInitialized,
        followUser,
        markers,
        polylines,
        polygons,
        statusMap,
        statusZoom,
        processMap,
      ];
}
