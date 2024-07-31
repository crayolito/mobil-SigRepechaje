import 'package:flutter/material.dart';

class ButtonOption extends StatelessWidget {
  const ButtonOption(
      {super.key,
      required this.status,
      this.onPressed,
      required this.texto,
      required this.icono1,
      required this.icono2});

  final VoidCallback? onPressed;
  final bool status;
  final String texto;
  final IconData icono1;
  final IconData icono2;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final subtitulo = Theme.of(context).textTheme.bodySmall;

    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
          backgroundColor: MaterialStateProperty.all(
            Colors.white.withOpacity(0.9),
          ),
          side: MaterialStateProperty.all(BorderSide(
            color: const Color(0xFF00A541).withOpacity(0.8),
            width: 4,
          )),
        ),
        icon: Icon(status ? icono1 : icono2,
            size: 50,
            color: status
                ? const Color(0xFF00A541)
                : const Color.fromRGBO(255, 33, 38, 1.0)),
        label: Text(
          texto,
          style: subtitulo,
        ));
  }
}
