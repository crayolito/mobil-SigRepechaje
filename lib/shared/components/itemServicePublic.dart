import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';

class ItemServicePublic extends StatelessWidget {
  const ItemServicePublic({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> serviciosCentroSalud = [
      "Consultas médicas generales",
      "Atención de urgencias y emergencias",
      "Consultas especializadas (pediatría, ginecología, dermatología, etc.)",
      "Vacunación y programas de inmunización",
      "Realización de análisis clínicos y pruebas diagnósticas",
      "Servicios de atención prenatal y obstetricia",
      "Rehabilitación y fisioterapia",
      "Orientación y consejería sobre salud sexual y reproductiva",
      "Programas de promoción de la salud y prevención de enfermedades",
      "Servicios de farmacia y dispensación de medicamentos"
    ];
    final size = MediaQuery.of(context).size;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium = Theme.of(context).textTheme.labelLarge!;
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: size.width * 0.03),
            child: Text(
              "Servicios Públicos".toUpperCase(),
              style: headlineLarge,
            ),
          ),
          ...serviciosCentroSalud.map((elemento) {
            return IconInformation(
              widthGeneral: size.width,
              icon: Icons.fiber_manual_record,
              iconSize: 20,
              heightGeneral: size.height * 0.09,
              widthIcon: size.width * 0.09,
              // widthText: size.width * 0.815,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: headlineLarge,
                  bodyText2: headlineMedium,
                  title: 0,
                  cantLineas: 3,
                  data1: elemento),
            );
          })
        ],
      ),
    );
  }
}
