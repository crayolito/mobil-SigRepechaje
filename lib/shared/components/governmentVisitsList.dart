import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';

class VisitList extends StatelessWidget {
  const VisitList({
    super.key,
    required this.visita,
  });

  final List<VisitaGubernamental> visita;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...visita.map((elemento) {
          return ItemVisitInfo(
            titulo: elemento.titulo,
            fecha: elemento.fecha,
            motivo: elemento.motivo,
            quienesVisitaron: elemento.quienesVisitaron,
          );
        })
      ],
    );
  }
}

class ItemVisitInfo extends StatelessWidget {
  const ItemVisitInfo({
    required this.titulo,
    required this.fecha,
    required this.motivo,
    required this.quienesVisitaron,
    super.key,
  });

  final String titulo;
  final String fecha;
  final String motivo;
  final String quienesVisitaron;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    return SizedBox(
        height: size.height * 0.33,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * 0.05,
              width: double.infinity,
              child: Text(titulo,
                  style: headlineLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
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
              heightGeneral: size.height * 0.1,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Motivo",
                  cantLineas: 3,
                  data1: motivo),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.people_alt_rounded,
              iconSize: 25,
              heightGeneral: size.height * 0.1,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  titulo: "Quienes Visitaron",
                  cantLineas: 3,
                  data1: quienesVisitaron),
            ),
          ],
        ));
  }
}
