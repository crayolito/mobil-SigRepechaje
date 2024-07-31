import 'package:flutter/material.dart';

class ImageDescription extends StatelessWidget {
  const ImageDescription({
    super.key,
    required this.image,
    required this.id,
    required this.checkIS,
    this.onTap,
  });

  final String image;
  final int id;
  // Check de seleccion
  final int checkIS;
  //
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decorationC1 = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color:
            id == checkIS ? const Color(0xFF00A541) : const Color(0xFF44BEED),
        width: 3,
      ),
    );

    final decorationC2 = BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: size.width * 0.05),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        width: size.width * 0.2,
        height: size.height * 0.08,
        decoration: decorationC1,
        child: Container(decoration: decorationC2),
      ),
    );
  }
}
