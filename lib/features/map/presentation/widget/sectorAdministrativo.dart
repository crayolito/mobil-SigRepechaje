import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectorAdministrativo extends StatelessWidget {
  const SectorAdministrativo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<GestionPrueba> gestion = [];
    String titulo = "";
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        gestion = List.from(gestionDataUD);
        titulo = "Turnos Administrativos";
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroPolicial:
      case InstitutionType.centroRecreativo:
      case InstitutionType.puntoTuristico:
      case InstitutionType.paradaMicros:
        titulo = "Info. Administrativa";
        gestion = List.from(gestionDataCM);
        break;
      default:
        titulo = "Info. Administrativa";
        gestion = List.from(gestionDataCM);
    }

    return SizedBox(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: size.width * 0.04, top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xFF00A541),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
            ),
          ),
          ...gestion.map((gestionData) {
            return TurnoExpansionContainerInfo(
              titleBase: 'Turno ${gestionData.titulo}',
              titleInfo1: "Director",
              textoBody1: gestionData.director,
              titleInfo2: "Horario de Atencion",
              textoBody2: gestionData.horarioAtencion,
              titleInfo3: "Nr Atencion",
              textoBody3: gestionData.telefonoAtencion,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class TurnoExpansionContainerInfo extends StatelessWidget {
  const TurnoExpansionContainerInfo({
    super.key,
    required this.titleBase,
    // Titulo Principal 1
    required this.titleInfo1,
    // Titulo Body 1
    required this.textoBody1,
    // Contenido Body 1
    required this.titleInfo2,
    required this.textoBody2,
    required this.titleInfo3,
    required this.textoBody3,
  });

  final String titleBase;

  final String titleInfo1;
  final String textoBody1;

  final String titleInfo2;
  final String textoBody2;

  final String titleInfo3;
  final String textoBody3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium = Theme.of(context).textTheme.labelLarge!;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: const Color(0xFF00A541)),
      child: ExpansionTile(
        title: Text(
          titleBase,
          style: headlineLarge,
        ),
        leading: const Icon(Icons.pending_actions_outlined),
        collapsedIconColor: const Color(0xFF44BEED),
        iconColor: const Color(0xFF44BEED),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                IconInformation(
                    icon: Icons.person,
                    iconSize: 25,
                    heightGeneral: size.height * 0.06,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: headlineLarge,
                        bodyText2: headlineMedium,
                        cantLineas: 2,
                        titulo: "Director",
                        data1: "Lic. Enriquer Alejandro Mamani ChoqueHuanca")),
                IconInformation(
                    icon: Icons.timer,
                    iconSize: 25,
                    heightGeneral: size.height * 0.07,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: headlineLarge,
                        bodyText2: headlineMedium,
                        cantLineas: 2,
                        titulo: "Horario Atencion",
                        data1: "08:00am - 12:00pm")),
                IconInformation(
                    icon: Icons.phone,
                    iconSize: 25,
                    heightGeneral: size.height * 0.06,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: headlineLarge,
                        bodyText2: headlineMedium,
                        cantLineas: 2,
                        titulo: "Nr Oficina",
                        data1: "+591 78452415")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
