import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/features/map/presentation/screen/infoWindow-screen.dart';
import 'package:distrito7_mobile/features/map/presentation/screen/map-view.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/optionsTerrainDif.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;
  late InfoMarkerBloc infoMarkerBloc;
  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    infoMarkerBloc.add(const OnChangeViewInfo(false));
    locationBloc.stopFolowwingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final subtitulo = Theme.of(context).textTheme.displayLarge;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        if (locationState.lastKnownLocation == null) {
          return const MapLoading();
        }
        return Stack(children: [
          BlocBuilder<MapBloc, MapState>(builder: (context, mapState) {
            return MapView(
              // initialLocation: locationState.lastKnownLocation!,
              initialLocation:
                  const LatLng(-17.794472039817705, -63.134594510363284),
              polygons: mapState.polygons.values.toSet(),
              markers: mapState.markers.values.toSet(),
              polylines: mapState.polylines.values.toSet(),
            );
          }),
          // OPCIONES DE CAMBIO DE VISTA EN EL MAPA
          institutionBloc.state.institutionType == InstitutionType.zonaVecinal
              ? const OptionsTerrainDif()
              : Container(),
          // PARTE : SUPERIOR
          institutionBloc.state.institutionType ==
                  InstitutionType.oficinaDistrital
              ? Container()
              : ContainerSearch(subtitulo: subtitulo),
          // PARTE : INFERIOR
          OptionsMap(locationState: locationState),
          // PARTE : VENTA DESPEGABLE INFORMACION INSTITUCION
          BlocBuilder<InfoMarkerBloc, InfoMarkerState>(
            builder: (context, infoMarkerState) {
              if (infoMarkerState.viewInfo) {
                return turismoBloc.state.showAlternativa
                    ? Container()
                    : FadeInUp(
                        child: WindoInfoCaseta(
                        contextMap: context,
                      ));
              }
              return Container();
            },
          )
        ]);
      },
    );
  }
}
