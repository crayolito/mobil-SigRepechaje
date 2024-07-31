import 'package:flutter/material.dart';

class ButtonGeoNB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconP;
  const ButtonGeoNB({super.key, required this.onPressed, required this.iconP});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
      child: FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: Colors.white.withOpacity(.90),
        onPressed: onPressed,
        child: Icon(
          iconP,
          size: 30,
          color: const Color(0xFF00A541),
        ),
      ),
    );
  }
}
