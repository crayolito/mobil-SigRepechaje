import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';

class TechnologyList extends StatelessWidget {
  const TechnologyList(
      {super.key, required this.suministros, required this.desayuno});
  final List<SuministroGubernamental> suministros;
  final List<DesayunoEscolar> desayuno;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...suministros.map((elemento) {
          return ItemExtraInformation(
              titulo: elemento.titulo,
              fecha: elemento.fecha,
              encargado: elemento.encargado,
              cantidad: elemento.cantidad);
        }).toList(),
        desayuno.isNotEmpty
            ? ItemSpecialInformation(
                titulo: "Desayuno Escolar",
                encargado: "Lic. Isabel Esther Mamani",
                desayuno: desayuno,
              )
            : Container()
      ],
    );
  }
}

class ItemExtraInformation extends StatelessWidget {
  const ItemExtraInformation({
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.cantidad,
    super.key,
  });

  final String titulo;
  final String fecha;
  final String encargado;
  final String cantidad;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    return SizedBox(
        height: size.height * 0.22,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: headlineLarge,
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.date_range_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Fecha",
                  cantLineas: 2,
                  data1: fecha),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.account_box_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Encargado",
                  cantLineas: 2,
                  data1: encargado),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.apps_sharp,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Cantidad",
                  cantLineas: 2,
                  data1: cantidad),
            ),
          ],
        ));
  }
}

class ItemSpecialInformation extends StatelessWidget {
  const ItemSpecialInformation({
    required this.titulo,
    required this.encargado,
    super.key,
    required this.desayuno,
  });

  final String titulo;
  final String encargado;
  final List<DesayunoEscolar> desayuno;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;

    return SizedBox(
        height: size.height * 0.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: headlineLarge,
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.account_box_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Encargado",
                  cantLineas: 2,
                  data1: encargado),
            ),
            ...desayuno.map((elemento) {
              return IconInformation(
                widthGeneral: size.width,
                icon: Icons.fiber_manual_record,
                iconSize: 20,
                heightGeneral: size.height * 0.1,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: headlineLarge,
                    bodyText2: headlineMedium,
                    titulo: elemento.dia,
                    cantLineas: 3,
                    data1: elemento.menu),
              );
            }).toList(),
          ],
        ));
  }
}
