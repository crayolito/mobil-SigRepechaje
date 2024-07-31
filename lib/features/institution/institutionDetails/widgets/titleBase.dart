import 'package:flutter/material.dart';

class TitleDateFirst extends StatelessWidget {
  const TitleDateFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final titulo = Theme.of(context).textTheme.displayMedium;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: AlignmentDirectional.bottomStart,
      height: (size.height * 0.618) * 0.08,
      width: size.width,
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "Datos Principales",
            style: titulo,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF44BEED),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 2.8,
            width: size.width * 0.6,
          )
        ],
      ),
    );
  }
}
