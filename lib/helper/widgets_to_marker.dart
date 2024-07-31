import 'dart:ui' as ui;

import 'package:distrito7_mobile/helper/markerSimple.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetMarker {
  String? nombre;
  // TAMAÑO DEL CUADRADO
  Size? size;
  //IMAGEN
  double? letf;
  double? top;
  //TEXTO
  double? sizeTexto;
  double? maxWitdh;
  double? dx;
  double? dy;
  Future<ui.Image> loadImage(String assetPath,
      {int width = 100, int height = 80}) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(bytes,
        targetWidth: width, targetHeight: height);
    final frame = await codec.getNextFrame();
    return frame.image;
  }

  Future<BitmapDescriptor> getCustomMarker(
      {required String nombre,
      required int zoom,
      required String lado,
      required String urlMarker}) async {
    this.nombre = nombre;
    await updateValues(zoom, lado);
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    // ui.Image? image = await loadImage('assets/marcadorColegio.png');
    ui.Image? image = await loadImage(urlMarker);

    final marker = MarkerSimple(
        image: image,
        nombre: nombre,
        sizeTexto: sizeTexto!,
        dx: dx!,
        dy: dy!,
        maxWitdh: maxWitdh!,
        letf: letf!,
        top: top!);
    marker.paint(canvas, size!);

    final picture = recorder.endRecording();
    final imageMarker =
        await picture.toImage(size!.width.toInt(), size!.height.toInt());

    final byteData =
        await imageMarker.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  Future updateValues(int zoom, String lado) async {
    if (lado.contains("a")) {
      switch (zoom) {
        case 11:
        case 12:
        case 13:
          sizeTexto = 36;
          size = const ui.Size(470.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 245;
          top = size!.height - 110;
          maxWitdh = 400;
          dx = size!.width - 379;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
        case 14:
        case 15:
        case 16:
          sizeTexto = 43;
          size = const ui.Size(490.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 255;
          top = size!.height - 110;
          maxWitdh = 320;
          dx = size!.width - 420;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
        default:
          sizeTexto = 45;
          size = const ui.Size(520.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 270;
          top = size!.height - 110;
          maxWitdh = 330;
          dx = size!.width - 430;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
      }
    }

    if (lado.contains("b")) {
      switch (zoom) {
        case 11:
        case 12:
        case 13:
          sizeTexto = 36;
          size = const ui.Size(470.42857142857144, 260.2285714285714);
          letf = size!.width - 90;
          top = size!.height - 110;
          maxWitdh = 350;
          dx = size!.width - 450;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
        case 14:
        case 15:
        case 16:
          sizeTexto = 43;
          size = const ui.Size(490.42857142857144, 260.2285714285714);
          letf = size!.width - 95;
          top = size!.height - 110;
          maxWitdh = 385;
          dx = size!.width - 485;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
        default:
          sizeTexto = 45;
          size = const ui.Size(520.42857142857144, 260.2285714285714);
          letf = size!.width - 95;
          top = size!.height - 110;
          maxWitdh = 515;
          dx = size!.width - 515;
          dy = (nombre!.length > 21) ? 160 : 170;
          break;
      }
    }

    if (lado.contains("c")) {
      switch (zoom) {
        case 11:
        case 12:
        case 13:
          sizeTexto = 36;
          size = const ui.Size(470.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 50;
          top = size!.height - 110;
          maxWitdh = 450;
          dx = size!.width / 2 - 210;
          dy = (nombre!.length > 21) ? 60 : 90;
          break;
        case 14:
        case 15:
        case 16:
          sizeTexto = 43;
          size = const ui.Size(490.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 50;
          top = size!.height - 110;
          maxWitdh = 450;
          dx = size!.width / 2 - 190;
          dy = (nombre!.length > 21) ? 50 : 90;
          break;
        default:
          sizeTexto = 45;
          size = const ui.Size(520.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 80;
          top = size!.height - 110;
          maxWitdh = 450;
          dx = size!.width - 515;
          dy = (nombre!.length > 21) ? 50 : 90;
          break;
      }
    }

    if (lado.contains("d")) {
      switch (zoom) {
        case 11:
        case 12:
        case 13:
          sizeTexto = 36;
          size = const ui.Size(470.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 35;
          top = size!.height - 210;
          maxWitdh = 450;
          dx = size!.width / 2 - 180;
          dy = (nombre!.length > 21) ? 170 : 70;
          break;
        case 14:
        case 15:
        case 16:
          sizeTexto = 43;
          size = const ui.Size(490.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 50;
          top = size!.height - 220;
          maxWitdh = 450;
          dx = size!.width / 2 - 195;
          dy = (nombre!.length > 21) ? 160 : 70;
          break;
        default:
          sizeTexto = 45;
          size = const ui.Size(520.42857142857144, 260.2285714285714);
          letf = size!.width / 2 - 50;
          top = size!.height - 220;
          maxWitdh = 450;
          dx = size!.width / 2 - 210;
          dy = (nombre!.length > 21) ? 160 : 70;
          break;
      }
    }
  }
}
