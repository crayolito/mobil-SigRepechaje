import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/sectorAdministrativo.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:distrito7_mobile/shared/widgets/imagesSwiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWindown extends StatelessWidget {
  const BodyWindown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final turismoBloc = BlocProvider.of<TurismoBloc>(context);
    final size = MediaQuery.of(context).size;
    List<String> imagenesExample = [
      "https://i.pinimg.com/564x/a5/af/07/a5af07dc6b0a19e622b4afd21abf2325.jpg",
      "https://i.pinimg.com/564x/eb/4b/9e/eb4b9e7e396d7d900cce64819d168e00.jpg",
      "https://i.pinimg.com/564x/10/6f/b4/106fb48b6259e6bae96a53d560fc3aaf.jpg",
      "https://i.pinimg.com/564x/11/62/e2/1162e24bc3d32113531d9988ef67d90e.jpg",
    ];

    return Material(
      child: SizedBox(
        height: size.height * 0.72,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ImagesSwiper(
                height: size.height * 0.40,
                width: size.width,
                images: imagenesExample,
                margin: const EdgeInsets.only(
                    bottom: 20, top: 15, left: 20, right: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    DividerPersonal(),
                    IconInformation(
                        icon: Icons.home,
                        heightGeneral: size.height * 0.07,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.14,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            cantLineas: 2,
                            // READ : CAMBIO DE SIG
                            // data1: infoMarkerBloc.state.infoStand!.nombre,
                            data1: turismoBloc.state.showPuntoInteres!.nombre,
                            bodyText1:
                                Theme.of(context).textTheme.headlineLarge,
                            bodyText2:
                                Theme.of(context).textTheme.headlineLarge)),
                    DividerPersonal(),
                    IconInformation(
                        icon: Icons.directions,
                        heightGeneral: size.height * 0.06,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.14,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            title: 1,
                            // READ : CAMBIO DE SIG
                            data1:
                                turismoBloc.state.showPuntoInteres!.direccion,
                            // data1: infoMarkerBloc.state.infoStand!.direccion,
                            bodyText1:
                                Theme.of(context).textTheme.headlineLarge,
                            bodyText2:
                                Theme.of(context).textTheme.headlineLarge)),
                    DividerPersonal(),
                    IconInformation(
                        icon: Icons.zoom_in_map_sharp,
                        heightGeneral: size.height * 0.06,
                        widthGeneral: size.width,
                        widthIcon: size.width * 0.14,
                        widthText: size.width * 0.85,
                        iconSize: 40,
                        textoFunction: cantidadText(
                            title: 1,
                            // READ : CAMBIO DE SIG
                            // data1: "UV - 58",
                            data1: turismoBloc.state.showPuntoInteres!.uv,
                            bodyText1:
                                Theme.of(context).textTheme.headlineLarge,
                            bodyText2:
                                Theme.of(context).textTheme.headlineLarge)),
                    DividerPersonal(),
                    const SectorAdministrativo()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container DividerPersonal() {
    return Container(
      height: 1.8,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: const Color(0xFF00A541).withOpacity(0.6),
    );
  }
}

class InformationSection extends StatelessWidget {
  final String data;
  final IconData icon;
  const InformationSection({
    super.key,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              icon,
              size: 40,
              color: const Color(0xFF44BEED),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    data,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF00A541),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
