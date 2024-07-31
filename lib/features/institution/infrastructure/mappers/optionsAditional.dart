import 'package:flutter/material.dart';

class OptionAditional {
  final String titulo;
  final GestureTapCallback onTap;
  final IconData icono;

  OptionAditional(
      {required this.titulo, required this.onTap, required this.icono});
}
