import 'package:flutter/material.dart';

class IconInformation extends StatelessWidget {
  const IconInformation({
    super.key,
    required this.icon,
    required this.widthGeneral,
    required this.heightGeneral,
    required this.widthIcon,
    required this.widthText,
    required this.iconSize,
    required this.textoFunction,
    this.onTap,
  });

  final IconData icon;
  final int iconSize;
  //Contenedor Base
  final double heightGeneral;
  final double widthGeneral;
  //Dimenciones Contenedor Icono
  final double widthIcon;
  //Dimenciones Contenedor Texto
  final double widthText;
  // Widget Texto
  final Widget textoFunction;
  //Presionar Boton
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: heightGeneral,
        width: widthGeneral,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: widthIcon,
              child: Icon(
                icon,
                size: iconSize.toDouble(),
                color: const Color(0xFF44BEED),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 5),
                alignment: AlignmentDirectional.centerStart,
                width: widthText,
                child: textoFunction),
          ],
        ),
      ),
    );
  }
}
