import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/helper/show_loading_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Polygon> polygons;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  const MapView({
    super.key,
    required this.initialLocation,
    required this.polygons,
    required this.markers,
    required this.polylines,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoadingMap(context);
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Navigator.pop(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CameraPosition initialCameraPosition =
        CameraPosition(target: widget.initialLocation, zoom: 17);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (pointerMoveEvent) {
          mapBloc.add(const OnChangedStatusFollowUser(false));
        },
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          onMapCreated: (GoogleMapController controller) =>
              mapBloc.add(OnMapInitialControllerMap(controller)),
          onCameraMove: (CameraPosition cameraPosition) =>
              mapBloc.add(OnMapControllerCamera(cameraPosition)),
          // TODO: Markers
          markers: widget.markers,
          // TODO: Polygons
          polygons: widget.polygons,
          // TODO: Polylines
          polylines: widget.polylines,
        ),
      ),
    );
  }
}
