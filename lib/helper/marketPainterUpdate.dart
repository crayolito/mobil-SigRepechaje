import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MarkerPainterUpdate extends CustomPainter {
  final ui.Image? image;
  final String categoria;
  final String nombre;

  MarkerPainterUpdate(this.image, this.categoria, this.nombre);

  @override
  void paint(Canvas canvas, Size size) async {
    // Lapiz verde
    final greenPaint = Paint()..color = const Color(0xFF00A541);
    // Lapiz blanco
    final whitePaint = Paint()..color = Colors.white;

    // Triangulo Verde
    final trianguloGreenPath = Path();
    trianguloGreenPath.moveTo(size.width / 2, size.height);
    trianguloGreenPath.lineTo(size.width / 2 + 20, 185);
    trianguloGreenPath.lineTo(size.width / 2 - 20, 185);
    canvas.drawPath(trianguloGreenPath, greenPaint);

    // Triangulo Blanco
    final trianguloWhitePath = Path();
    trianguloWhitePath.moveTo(size.width / 2, size.height - 15);
    trianguloWhitePath.lineTo(size.width / 2 + 12, 190);
    trianguloWhitePath.lineTo(size.width / 2 - 12, 190);
    canvas.drawPath(trianguloWhitePath, whitePaint);

    // Dibujar una caja Verde
    final path = Path();
    path.moveTo(40, 0);

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, 150),
        const Radius.circular(20),
      ),
    );

    //Dibujar la sombra en la caja Verde
    // canvas.drawShadow(path, Colors.black, 10, false);

    //Dibujar la caja Verde en el Canvas
    canvas.drawPath(path, greenPaint);

    // Dibujar un Caja Blanca
    final path2 = Path();
    path2.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(10, 10, size.width - 310, 130),
        const Radius.circular(10)));
    canvas.drawPath(path2, whitePaint);

    // Dibujar la imagen
    if (image != null) {
      final srcRect =
          Offset.zero & Size(image!.width.toDouble(), image!.height.toDouble());
      const dstRect = Rect.fromLTWH(18, 30, 85, 80);
      canvas.drawImageRect(image!, srcRect, dstRect, Paint());
    }

    // Dibujar el Categoria de la Institucion
    final textSpan1 = TextSpan(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Times New Roman',
      ),
      text: categoria,
    );
    final text1 = TextPainter(
        text: textSpan1,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout(maxWidth: 300, minWidth: 100);

    final double offsetY0 = (nombre.length > 21) ? 15 : 30;

    text1.paint(canvas, Offset(size.width - 290, offsetY0));

    // Dibujar el Nombre de la Institutocion
    final textSpan2 = TextSpan(
      style: const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'Times New Roman',
      ),
      // text: "Santa Rita de la Sierrra Santisima Pureza",
      text: nombre,
    );
    final text2 = TextPainter(
        maxLines: 2,
        ellipsis: "...",
        text: textSpan2,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout(maxWidth: 300, minWidth: 100);

    final double offsetY = (nombre.length > 21) ? 60 : 80;
    text2.paint(canvas, Offset(size.width - 290, offsetY));
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
