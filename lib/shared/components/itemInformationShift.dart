import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemInformationShift extends StatelessWidget {
  const ItemInformationShift({super.key, required this.infoGestion});

  final GestionPrueba infoGestion;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    String tituloJunta = "";
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        tituloJunta = "JUNTA ESCOLAR";
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroPolicial:
      case InstitutionType.centroRecreativo:
      case InstitutionType.puntoTuristico:
      case InstitutionType.paradaMicros:
        tituloJunta = "JUNTA DIRECTA";
        break;
      default:
    }
    return SizedBox(
        height: size.height * 0.65,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TURNO ${infoGestion.titulo}".toUpperCase(),
              style: headlineLarge,
            ),
            IconInformation(
              icon: Icons.person,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthGeneral: size.width,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Director",
                  cantLineas: 2,
                  data1: infoGestion.director),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.timer,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Horario Atencion",
                  cantLineas: 2,
                  data1: infoGestion.horarioAtencion),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.phone,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                bodyText1: headlineLarge,
                bodyText2: headlineMedium,
                titulo: "Nr Oficina",
                cantLineas: 2,
                data1: infoGestion.telefonoAtencion,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              tituloJunta.toUpperCase(),
              style: headlineLarge,
            ),
            IconInformation(
              icon: Icons.person,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthGeneral: size.width,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Presidente",
                  cantLineas: 2,
                  data1: infoGestion.presidenteConsejo),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.phone,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                bodyText1: headlineLarge,
                bodyText2: headlineMedium,
                titulo: "Nr Telefono",
                cantLineas: 2,
                data1: infoGestion.telefonoConsejo,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(infoGestion.imgConsejo),
                      fit: BoxFit.cover)),
            )
          ],
        ));
  }
}
