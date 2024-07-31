import 'package:flutter/material.dart';

Widget cantidadText({
  String titulo = "",
  int title = 0,
  int cantLineas = 1,
  String data1 = "",
  TextStyle? bodyText1,
  TextStyle? bodyText2,
}) {
  if (titulo.isNotEmpty && data1.isNotEmpty) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: '$titulo :\n', style: bodyText1),
        TextSpan(text: '$data1 ', style: bodyText2)
      ]),
      maxLines: cantLineas,
      overflow: TextOverflow.ellipsis,
    );
  }

  if (title == 1) {
    return Text(
      data1,
      style: bodyText1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
  return Text(
    data1,
    style: bodyText2,
    maxLines: cantLineas,
    overflow: TextOverflow.ellipsis,
  );
}
