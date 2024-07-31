import 'package:flutter/material.dart';

class IconButtonCustomCUE extends StatelessWidget {
  const IconButtonCustomCUE(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.heroTag});

  final String heroTag;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: const Color(0xff424530).withOpacity(0.5),
      shape: BoxShape.circle,
    );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(7.6),
      height: 65,
      width: 65,
      decoration: decoration,
      child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: onPressed,
          backgroundColor: Colors.white.withOpacity(0.85),
          shape: const CircleBorder(),
          child: Icon(
            icon,
            color: const Color(0xff424530),
            size: 35,
            // shadows: shadowPPN3,
          )
          // Transform.translate(
          //   offset: const Offset(5, 0),
          //   child: Icon(
          //     icon,
          //     color: const Color(0xff424530),
          //     size: 35,
          //     shadows: shadowPPN3,
          //   ),
          // ),
          ),
    );
  }
}
