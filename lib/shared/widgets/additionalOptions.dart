import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/optionsAditional.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/helper/show_loading_message.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdditionalOptions extends StatefulWidget {
  const AdditionalOptions({
    super.key,
    required ScrollController scrollController,
    this.contextMap,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final BuildContext? contextMap;

  @override
  State<AdditionalOptions> createState() => _AdditionalOptionsState();
}

class _AdditionalOptionsState extends State<AdditionalOptions> {
  @override
  Widget build(BuildContext context) {
    List<OptionAditional> opcionesAdicionales = [];
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final size = MediaQuery.of(context).size;

    opcionesAdicionales = [
      OptionAditional(
          titulo: "VR 360°",
          onTap: () async {
            // Navigator.pushNamed(context, '/videoVR360');
            String url = 'https://youtu.be/DH27DxTZOz4?si=PFwhQocUinW7v8VW';
            try {
              await launch(url);
            } catch (e) {
              throw 'No se pudo abrir $e';
            }
          },
          icono: FontAwesomeIcons.youtube),
      OptionAditional(
          titulo: "Formulario Quejas",
          onTap: () async {
            await launchUrl(Uri.parse(
                'https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform'));
          },
          icono: FontAwesomeIcons.filePen),
      OptionAditional(
          titulo: "Google Maps",
          onTap: () async {
            await launchUrl(
                Uri.parse('https://maps.app.goo.gl/sk7HDf8RJbCDz5oy6'));
          },
          icono: FontAwesomeIcons.google),
      OptionAditional(
          titulo: "Ver Ubicacion en Mapa",
          onTap: () async {
            if (institutionBloc.state.institutionType ==
                InstitutionType.oficinaDistrital) {
              Navigator.pushNamed(context, '/mapa');
              return;
            }
            Navigator.pop(context);
            infoMarkerBloc
                .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
            mapBloc.add(const OnChangeProcessMap(false));
            mapBloc.add(const OnChangedStatusFollowUser(false));
            showLoadingMap(widget.contextMap!);
            mapBloc.moveCameraMyLocation(
              const LatLng(-17.795055687176283, -63.13163979699569),
            );
            mapBloc.add(const OnRankingMarkerByZoom(17));
            mapBloc.add(const OnChangeProcessMap(true));
            Future.delayed(const Duration(seconds: 2)).then((_) {
              Navigator.pop(widget.contextMap!);
            });
          },
          icono: FontAwesomeIcons.mapLocationDot),
      OptionAditional(
          titulo: "Historia",
          onTap: () {
            Navigator.pushNamed(context, '/historiaInsti');
            ;
          },
          icono: FontAwesomeIcons.book),
    ];

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroSalud:
      case InstitutionType.centroPolicial:
      case InstitutionType.oficinaDistrital:
      case InstitutionType.centroRecreativo:
        opcionesAdicionales.removeAt(opcionesAdicionales.length - 1);
        break;
      case InstitutionType.unidadEducativa:
      case InstitutionType.puntoTuristico:
        break;
      case InstitutionType.paradaMicros:
      case InstitutionType.zonaVecinal:
        break;
      default:
        break;
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              if (widget._scrollController.hasClients) {
                widget._scrollController.animateTo(
                  widget._scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            });
          }
        },
        title: Text(
          "Opciones Adicionales",
          style: headlineLarge,
        ),
        leading: const Icon(
          Icons.settings,
          size: 30,
        ),
        collapsedIconColor: const Color(0xFF44BEED),
        iconColor: const Color(0xFF44BEED),
        children: [
          Container(
            // color: ,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: size.width,
            child: Column(
              children: [
                ...opcionesAdicionales.map((e) {
                  return GestureDetector(
                      onTap: e.onTap,
                      child: Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color(0xFF44BEED), width: 3),
                          ),
                          child: IconInformation(
                            icon: e.icono,
                            widthGeneral: size.width,
                            heightGeneral: (size.height * 0.61) * 0.08,
                            widthIcon: size.width * 0.09,
                            widthText: size.width * 0.6,
                            iconSize: 20,
                            textoFunction: cantidadText(
                              bodyText1: headlineLarge,
                              title: 1,
                              data1: e.titulo,
                            ),
                          )));
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// // FORMULARIO DE QUEJAS
//                 GestureDetector(
//                   onTap: () async {
//                     await launchUrl(Uri.parse(
//                         'https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform'));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border:
//                           Border.all(color: const Color(0xFF44BEED), width: 3),
//                     ),
//                     child: IconInformation(
//                         widthGeneral: size.width,
//                         icon: FontAwesomeIcons.filePen,
//                         iconSize: 20,
//                         heightGeneral: (size.height * 0.61) * 0.08,
//                         widthIcon: size.width * 0.09,
//                         widthText: size.width * 0.6,
//                         textoFunction: cantidadText(
//                             headlineLarge: headlineLarge,
//                             title: 1,
//                             data1: "Formulario Quejas")),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // BOTON DE ENTRADA A GOOGLE MAPS
//                 GestureDetector(
//                   onTap: () async {
//                     await launchUrl(
//                         Uri.parse('https://maps.app.goo.gl/sk7HDf8RJbCDz5oy6'));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border:
//                           Border.all(color: const Color(0xFF44BEED), width: 3),
//                     ),
//                     child: IconInformation(
//                         widthGeneral: size.width,
//                         icon: FontAwesomeIcons.google,
//                         iconSize: 20,
//                         heightGeneral: (size.height * 0.61) * 0.08,
//                         widthIcon: size.width * 0.09,
//                         widthText: size.width * 0.6,
//                         textoFunction: cantidadText(
//                             headlineLarge: headlineLarge,
//                             title: 1,
//                             data1: "Google Maps")),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // BOTON DE UBICACION EN MAPA DE LA APP
//                 GestureDetector(
//                   onTap: onTapMAPAPP,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border:
//                           Border.all(color: const Color(0xFF44BEED), width: 3),
//                     ),
//                     child: IconInformation(
//                         widthGeneral: size.width,
//                         icon: FontAwesomeIcons.mapLocationDot,
//                         iconSize: 20,
//                         heightGeneral: (size.height * 0.61) * 0.08,
//                         widthIcon: size.width * 0.09,
//                         widthText: size.width * 0.6,
//                         textoFunction: cantidadText(
//                             headlineLarge: headlineLarge,
//                             title: 1,
//                             data1: "Ver Ubicacion en Mapa")),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // SCREEN DE LA HISTORIA
//                 institutionBloc.state.institutionType ==
//                             InstitutionType.oficinaDistrital ||
//                         institutionBloc.state.institutionType ==
//                             InstitutionType.centroPolicial
//                     ? const SizedBox()
//                     : GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(context, '/historiaInsti');
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                                 color: const Color(0xFF44BEED), width: 3),
//                           ),
//                           child: IconInformation(
//                               widthGeneral: size.width,
//                               icon: FontAwesomeIcons.book,
//                               iconSize: 20,
//                               heightGeneral: (size.height * 0.61) * 0.08,
//                               widthIcon: size.width * 0.09,
//                               widthText: size.width * 0.6,
//                               textoFunction: cantidadText(
//                                   headlineLarge: headlineLarge,
//                                   title: 1,
//                                   data1: "Historia")),
//                         ),
//                       ),
//                 // VIDEO VR 360
//                 const SizedBox(
//                   height: 10,
//                 ),
// GestureDetector(
//   onTap: () async {
//     String url =
//         'https://www.youtube.com/watch?v=h0hfv4VMoGk&list=RDh0hfv4VMoGk&start_radio=1';
//     try {
//       await launch(url);
//     } catch (e) {
//       throw 'No se pudo abrir $e';
//     }
//   },
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15),
//       border:
//           Border.all(color: const Color(0xFF44BEED), width: 3),
//     ),
//     child: IconInformation(
//         widthGeneral: size.width,
//         icon: FontAwesomeIcons.youtube,
//         iconSize: 20,
//         heightGeneral: (size.height * 0.61) * 0.08,
//         widthIcon: size.width * 0.09,
//         widthText: size.width * 0.6,
//         textoFunction: cantidadText(
//             headlineLarge: headlineLarge, title: 1, data1: "VR 360°")),
//   ),
// )
