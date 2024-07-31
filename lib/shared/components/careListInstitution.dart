import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AreaCareList extends StatelessWidget {
  const AreaCareList({
    super.key,
    required this.mantenimiento,
  });

  final List<MantemientoInfraestructura> mantenimiento;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...mantenimiento.map((elemento) {
          return ItemCareInfo(
              titulo: elemento.titulo,
              fecha: elemento.fecha,
              encargado: elemento.encargado,
              empresa: elemento.empresa);
        }).toList()
      ],
    );
  }
}

class ItemCareInfo extends StatelessWidget {
  const ItemCareInfo({
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.empresa,
    super.key,
  });

  final String titulo;
  final String fecha;
  final String encargado;
  final String empresa;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    return SizedBox(
        height: size.height * 0.17,
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
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction:
                  cantidadText(bodyText2: headlineMedium, data1: fecha),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.account_box_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction:
                  cantidadText(bodyText2: headlineMedium, data1: encargado),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: FontAwesomeIcons.buildingShield,
              iconSize: 25,
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                bodyText2: headlineMedium,
                data1: empresa,
              ),
            ),
          ],
        ));
  }
}
