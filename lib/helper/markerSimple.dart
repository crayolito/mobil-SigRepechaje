import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MarkerSimple extends CustomPainter {
  final ui.Image? image;
  final String nombre;
  //IMAGEN
  final double letf;
  final double top;
  //TEXTO
  final double sizeTexto;
  final double maxWitdh;
  final double dx;
  final double dy;

  MarkerSimple({
    this.image,
    required this.nombre,
    required this.letf,
    required this.top,
    required this.maxWitdh,
    required this.dx,
    required this.dy,
    required this.sizeTexto,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    // Dibujar la imagen
    if (image != null) {
      final srcRect =
          Offset.zero & Size(image!.width.toDouble(), image!.height.toDouble());
      final dstRect =
          //Rect.fromLTWH(Letf, Top, Width, Height);
          Rect.fromLTWH(letf, top, 100, 110);
      canvas.drawImageRect(image!, srcRect, dstRect, Paint());
    }

    // Dibujar el Nombre de la Institutocion
    final textSpan2 = TextSpan(
      style: TextStyle(
        fontSize: sizeTexto,
        color: Colors.black,
        fontFamily: 'Times New Roman',
        fontWeight: FontWeight.bold,
        shadows: const [
          Shadow(
            // Sombra inferior derecha
            offset: Offset(1.5, 1.5),
            color: Color(0xFF00A541),
          ),
          Shadow(
            // Sombra inferior izquierda
            offset: Offset(-1.5, 1.5),
            color: Color(0xFF00A541),
          ),
          Shadow(
            // Sombra superior derecha
            offset: Offset(1.5, -1.5),
            color: Color(0xFF00A541),
          ),
          Shadow(
            // Sombra superior izquierda
            offset: Offset(-1.5, -1.5),
            color: Color(0xFF00A541),
          ),
        ],
      ),
      text: nombre,
    );
    final text2 = TextPainter(
        maxLines: 2,
        ellipsis: "...",
        text: textSpan2,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(maxWidth: maxWitdh, minWidth: 100);
    text2.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return false;
  }
}
