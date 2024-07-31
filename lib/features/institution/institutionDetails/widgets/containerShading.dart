import 'package:flutter/material.dart';

class ContainerShading extends StatelessWidget {
  const ContainerShading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height * 0.40,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0, 0.5, 0.7, 2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
