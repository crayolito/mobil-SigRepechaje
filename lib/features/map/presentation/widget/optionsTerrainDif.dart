import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/features/map/infrastructure/mappers/optionTerrainMap.dart';
import 'package:distrito7_mobile/shared/widgets/buttonGeoNB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsTerrainDif extends StatelessWidget {
  const OptionsTerrainDif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.104,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * 0.02),
        child: Align(
          alignment: Alignment.topRight,
          child: ButtonGeoNB(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return FadeInUp(child: ContainerPrincipal());
                    });
              },
              iconP: Icons.layers),
        ),
      ),
    );
  }
}

class ContainerPrincipal extends StatefulWidget {
  const ContainerPrincipal({
    super.key,
  });

  @override
  State<ContainerPrincipal> createState() => _ContainerPrincipalState();
}

class _ContainerPrincipalState extends State<ContainerPrincipal> {
  int claveView = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<TerrainMap> listItems = [
      TerrainMap(
          clave: 0,
          titulo: "UV",
          image: "assets/mapa/zonaUV.png",
          statusMap: StatusDetailMap.zonaUV),
      TerrainMap(
          clave: 1,
          titulo: "BARRIOS",
          image: "assets/mapa/zonaVecinales.png",
          statusMap: StatusDetailMap.zonaBarrios),
    ];

    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.68,
          ),
          Container(
            height: size.height * 0.284,
            color: Colors.white,
            child: Column(
              children: [
                const TitlePrincipal(),
                SizedBox(
                  height: (size.height * 0.284) * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...listItems.map((e) {
                        return ItemDifTerrainMap(
                          titulo: e.titulo,
                          image: e.image,
                          clave: e.clave,
                          viewClave: claveView,
                          onTap: () {
                            setState(() {
                              claveView = e.clave;
                              BlocProvider.of<MapBloc>(context)
                                  .add(OnChangeStatusDetailMap(e.statusMap));
                            });
                          },
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemDifTerrainMap extends StatelessWidget {
  const ItemDifTerrainMap({
    super.key,
    required this.clave,
    required this.viewClave,
    required this.titulo,
    required this.image,
    required this.onTap,
  });

  final int clave;
  final int viewClave;
  final String titulo;
  final String image;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titulo1 = Theme.of(context).textTheme.headlineLarge;
    final titulo2 = Theme.of(context).textTheme.headlineSmall;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width * 0.35,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: size.height * 0.01),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: clave == viewClave
                          ? const Color(0xFF00A541)
                          : const Color(0xFF44BEED),
                      width: 3.5),
                  borderRadius: BorderRadius.circular(10)),
              height: (size.height * 0.284) * 0.45,
              child: Image.asset(image),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              titulo,
              style: clave == viewClave ? titulo1 : titulo2,
            )
          ],
        ),
      ),
    );
  }
}

class TitlePrincipal extends StatelessWidget {
  const TitlePrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final subtitulo = Theme.of(context).textTheme.headlineLarge;
    return Container(
      margin:
          EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.01),
      height: (size.height * 0.284) * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "DETALLES DE MAPA",
            style: subtitulo,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Color(0xFF00A541),
                size: 30,
              ))
        ],
      ),
    );
  }
}
