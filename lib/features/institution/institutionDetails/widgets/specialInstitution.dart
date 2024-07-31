import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/titleBase.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/DropDownInfoBloc.dart';
import 'package:distrito7_mobile/shared/widgets/additionalOptions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SpecialInstitution
class SpecialInstitution extends StatelessWidget {
  const SpecialInstitution({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    // List<String> servicios = [
    //   "Atencion al Vecino",
    //   "Alumbrado Publico",
    //   "Emacruz",
    //   "Area de Salud",
    //   "S.A.T - Secretaria de Administracion Tributaria",
    //   "Seguridad Ciudadana",
    // ];

    // List<String> imagenesExample = [
    //   "https://i.pinimg.com/564x/a5/af/07/a5af07dc6b0a19e622b4afd21abf2325.jpg",
    //   "https://i.pinimg.com/564x/eb/4b/9e/eb4b9e7e396d7d900cce64819d168e00.jpg",
    //   "https://i.pinimg.com/564x/10/6f/b4/106fb48b6259e6bae96a53d560fc3aaf.jpg",
    //   "https://i.pinimg.com/564x/11/62/e2/1162e24bc3d32113531d9988ef67d90e.jpg",
    // ];

    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium = Theme.of(context).textTheme.labelLarge!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleDateFirst(),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.person,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: tituloInstiSpecial(institutionBloc.state.institutionType),
              cantLineas: 3,
              data1: "Dora Erika Justiniano Burgos"),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.house_outlined,
          iconSize: 35,
          heightGeneral: (size.height * 0.618) * 0.2,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: "DIRECCION",
              cantLineas: 4,
              data1:
                  "Av. General Campero, calle #7, entre Av. Cumavi y Av. Tres Pasos al Frente."),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.timer,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: "HORARIO ATENCION",
              cantLineas: 2,
              data1: "8:00am a 4:00 pm"),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.phone,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.1,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: "NR ATENCION",
              cantLineas: 2,
              data1: "800 12 5700"),
        ),
        DropDownInfoBloc(
            onTap: () async {
              Future.delayed(const Duration(seconds: 1)).then((_) {
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent + 100,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              });
            },
            checkIS: institutionBloc.state.checkInitAdm,
            optionsInfo: institutionBloc.state.optionsAdm),
        AdditionalOptions(
          scrollController: _scrollController,
        )
      ],
    );
  }

  String tituloInstiSpecial(InstitutionType type) {
    switch (type) {
      case InstitutionType.oficinaDistrital:
        return "SUB ALCALDE";
      case InstitutionType.puntoTuristico:
        return "ENCARGADO";
      case InstitutionType.centroPolicial:
        return "ENCARGADO";
      default:
        return "";
    }
  }
}

class OnlyImage extends StatelessWidget {
  const OnlyImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.049,
          left: size.width * 0.04,
          right: size.width * 0.04),
      width: size.width,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("assets/fondo/OficinaSubAl.png"),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ],
      ),
    );
  }
}



// // SpecialInstitution
// class SpecialInstitution extends StatelessWidget {
//   const SpecialInstitution({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> servicios = [
//       "Atencion al Vecino",
//       "Alumbrado Publico",
//       "Emacruz",
//       "Area de Salud",
//       "S.A.T - Secretaria de Administracion Tributaria",
//       "Seguridad Ciudadana",
//     ];

//     List<String> imagenesExample = [
//       "https://i.pinimg.com/564x/a5/af/07/a5af07dc6b0a19e622b4afd21abf2325.jpg",
//       "https://i.pinimg.com/564x/eb/4b/9e/eb4b9e7e396d7d900cce64819d168e00.jpg",
//       "https://i.pinimg.com/564x/10/6f/b4/106fb48b6259e6bae96a53d560fc3aaf.jpg",
//       "https://i.pinimg.com/564x/11/62/e2/1162e24bc3d32113531d9988ef67d90e.jpg",
//     ];

//     final size = MediaQuery.of(context).size;
//     final ScrollController _scrollController = ScrollController();
//     final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
//     final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
//     final TextStyle headlineMedium = Theme.of(context).textTheme.headlineMedium!;

//     return Scaffold(
//       floatingActionButton: const ButtonCloseScreen(),
//       body: Container(
//         width: size.width,
//         height: size.height,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/fondo/bg.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.only(
//               left: size.width * 0.027, right: size.width * 0.027),
//           child: SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children: [
//                 ImagesSwiper(
//                   height: size.height * 0.35,
//                   width: size.width,
//                   images: imagenesExample,
//                   margin: EdgeInsets.only(
//                     top: size.height * 0.049,
//                     // left: size.width * 0.04,
//                     // right: size.width * 0.04
//                   ),
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.5),
//                         spreadRadius: 4,
//                         blurRadius: 8,
//                         offset: const Offset(0, 1),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // OnlyImage(size: size),
//                 SizedBox(
//                   height: size.height * 0.03,
//                 ),
//                 const TitleDateFirst(),
//                 IconInformation(
//                   widthGeneral: size.width,
//                   icon: Icons.person,
//                   iconSize: 30,
//                   heightGeneral: (size.height * 0.618) * 0.15,
//                   widthIcon: size.width * 0.09,
//                   widthText: size.width * 0.85,
//                   textoFunction: cantidadText(
//                       headlineLarge: headlineLarge,
//                       headlineMedium: headlineMedium,
//                       titulo: "SUB ALCALDE",
//                       cantLineas: 3,
//                       data1: "Dora Erika Justiniano Burgos"),
//                 ),
//                 IconInformation(
//                   widthGeneral: size.width,
//                   icon: Icons.house_outlined,
//                   iconSize: 35,
//                   heightGeneral: (size.height * 0.618) * 0.2,
//                   widthIcon: size.width * 0.09,
//                   widthText: size.width * 0.85,
//                   textoFunction: cantidadText(
//                       headlineLarge: headlineLarge,
//                       headlineMedium: headlineMedium,
//                       titulo: "DIRECCION",
//                       cantLineas: 4,
//                       data1:
//                           "Av. General Campero, calle #7, entre Av. Cumavi y Av. Tres Pasos al Frente."),
//                 ),
//                 IconInformation(
//                   widthGeneral: size.width,
//                   icon: Icons.timer,
//                   iconSize: 30,
//                   heightGeneral: (size.height * 0.618) * 0.15,
//                   widthIcon: size.width * 0.09,
//                   widthText: size.width * 0.85,
//                   textoFunction: cantidadText(
//                       headlineLarge: headlineLarge,
//                       headlineMedium: headlineMedium,
//                       titulo: "HORARIO ATENCION",
//                       cantLineas: 2,
//                       data1: "8:00am a 4:00 pm"),
//                 ),
//                 IconInformation(
//                   widthGeneral: size.width,
//                   icon: Icons.phone,
//                   iconSize: 30,
//                   heightGeneral: (size.height * 0.618) * 0.1,
//                   widthIcon: size.width * 0.09,
//                   widthText: size.width * 0.85,
//                   textoFunction: cantidadText(
//                       headlineLarge: headlineLarge,
//                       headlineMedium: headlineMedium,
//                       titulo: "NR ATENCION",
//                       cantLineas: 2,
//                       data1: "800 12 5700"),
//                 ),
//                 DropDownInfoBloc(
//                     onTap: () async {
//                       Future.delayed(const Duration(seconds: 1)).then((_) {
//                         if (_scrollController.hasClients) {
//                           _scrollController.animateTo(
//                             _scrollController.position.maxScrollExtent + 100,
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.easeInOut,
//                           );
//                         }
//                       });
//                     },
//                     checkIS: institutionBloc.state.checkInitAdm,
//                     optionsInfo: institutionBloc.state.optionsAdm),
//                 AdditionalOptions(
//                   scrollController: _scrollController,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
