import 'dart:ui' as ui;

import 'package:distrito7_mobile/helper/widgets_to_marker.dart';
import 'package:flutter/material.dart';

class MiWidget extends StatefulWidget {
  @override
  _MiWidgetState createState() => _MiWidgetState();
}

class _MiWidgetState extends State<MiWidget> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    WidgetMarker().loadImage('assets/marcadorColegio.png').then((loadedImage) {
      setState(() {
        image = loadedImage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: Container(
        //     width: 520.42857142857144,
        //     height: 260.2285714285714,
        //     color: Colors.red,
        //     // color: Colors.red,
        //     child: CustomPaint(
        //       painter: MarkerSimple2(image, "Unidad Educativa",
        //           "Maria Del Carmen de la Purita Solines de la Purita"),
        //     ),
        //   ),
        // ),
        );
  }
}
