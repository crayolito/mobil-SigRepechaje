import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/config/constants/paleta-colores.dart';
import 'package:distrito7_mobile/helper/show_loading_message.dart';
import 'package:distrito7_mobile/shared/widgets/buttonGeoNB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionsMap extends StatelessWidget {
  const OptionsMap({
    super.key,
    required this.locationState,
  });

  final LocationState locationState;
  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.02),
      child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: "1",
                mini: true,
                onPressed: () {
                  mapBloc.add(const OnRoutesMultiPuntosInterest());
                  // mapBloc.add(const OnInitRouteMultiPuntosInterest(2));
                },
                backgroundColor: Colors.white.withOpacity(0.85),
                child: Icon(
                  FontAwesomeIcons.route,
                  size: size.width * 0.055,
                  color: kPrimaryColor,
                ),
              ),
              ButtonGeoNB(
                onPressed: () {
                  // mapBloc.reorientMap();
                },
                iconP: FontAwesomeIcons.compass,
              ),
              ButtonGeoNB(
                onPressed: () async {
                  // PONE EL MAPA EN PROCESO DE CARGA
                  // ESTO LO HACE PARA PODER NO SE REALIZEN CAMBIOS EN LOS MARCADORES AL CAMBIAR EL ZOOM
                  mapBloc.add(const OnChangeProcessMap(false));
                  // ESTO CANCELA EL SEGUIMIENTO DEL USUARIO POR LA CAMARA
                  mapBloc.add(const OnChangedStatusFollowUser(false));
                  // LANZA UNA VENTANA DE CARGA PARA QUE EL USUARIO SEPA QUE ESTA CARGANDO
                  showLoadingMap(context);
                  // ESTABLECE LOS LIMITES DEL DISTRITO 7 PUEDA VER EL USUARIO
                  await mapBloc.setBoundsD7();
                  if (institutionBloc.state.institutionType !=
                      InstitutionType.oficinaDistrital) {
                    // ESTABLECE LOS MARCADORES DE ACUERDO AL ZOOM RANGO MENOR A 12
                    mapBloc.add(const OnRankingMarkerByZoom(12));
                  }
                  // ESTABLECE UN PROCESO DE TIEMPO QUE ESPERA 3
                  Future.delayed(const Duration(seconds: 2)).then((_) async {
                    // ESTO PERMITE QUE SE REALIZEN CAMBIOS EN LOS MARCADORES POR EL ZOOM
                    mapBloc.add(const OnChangeProcessMap(true));
                    // CIERTA LA VENTANA DE ESPERA
                    Navigator.pop(context);
                  });
                },
                iconP: Icons.share_location_outlined,
              ),
              ButtonGeoNB(
                onPressed: () async {
                  mapBloc.add(const OnChangeProcessMap(false));
                  mapBloc.add(const OnChangedStatusFollowUser(false));
                  showLoadingMap(context);
                  mapBloc
                      .moveCameraMyLocation(locationState.lastKnownLocation!);
                  if (institutionBloc.state.institutionType !=
                      InstitutionType.oficinaDistrital) {
                    mapBloc.add(const OnRankingMarkerByZoom(17));
                  }
                  Future.delayed(const Duration(seconds: 2)).then((_) {
                    mapBloc.add(const OnChangeProcessMap(true));
                    Navigator.pop(context);
                  });
                },
                iconP: Icons.my_location_outlined,
              ),
              ButtonGeoNB(
                onPressed: () async {
                  if (mapBloc.state.followUser) {
                    mapBloc.add(
                        OnChangedStatusFollowUser(!mapBloc.state.followUser));
                  } else {
                    showLoadingMap(context);
                    mapBloc.add(const OnChangeProcessMap(false));
                    mapBloc.add(
                        OnChangedStatusFollowUser(!mapBloc.state.followUser));
                    if (institutionBloc.state.institutionType !=
                        InstitutionType.oficinaDistrital) {
                      mapBloc.add(const OnRankingMarkerByZoom(17));
                    }
                    Future.delayed(const Duration(seconds: 4)).then((_) {
                      mapBloc.add(const OnChangeProcessMap(true));
                      Navigator.pop(context);
                    });
                  }
                },
                iconP: mapBloc.state.followUser
                    ? FontAwesomeIcons.personWalking
                    : FontAwesomeIcons.person,
              )
            ],
          )),
    );
  }
}
