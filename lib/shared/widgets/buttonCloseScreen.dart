import 'package:flutter/material.dart';

class ButtonCloseScreen extends StatelessWidget {
  const ButtonCloseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      height: 60, // Ajusta a tu gusto
      width: 60,
      decoration: BoxDecoration(
        color: Color(0xFF44BEED).withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white.withOpacity(0.85),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_back,
          color: Color(0xFF44BEED),
          size: 35,
        ),
      ),
    );
  }
}
