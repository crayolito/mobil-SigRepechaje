

// Future<BitmapDescriptor> getNetworkImageMarker(String urlMarker) async {
//   final resp = await Dio().get(
//     urlMarker,
//     options: Options(responseType: ResponseType.bytes),
//   );

//   final imageCodec = await ui.instantiateImageCodec(resp.data,
//       targetHeight: 120, targetWidth: 120);
//   final frame = await imageCodec.getNextFrame();
//   final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

//   return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
// }
