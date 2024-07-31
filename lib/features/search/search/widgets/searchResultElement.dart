import 'package:flutter/material.dart';

class SearchResultElement extends StatelessWidget {
  const SearchResultElement({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final decorationC1 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: color, width: 8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ]);
    final decorationC2 = BoxDecoration(
      color: const Color(0xFF00A541).withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),
    );
    final size = MediaQuery.of(context).size;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    
    return Container(
      height: size.height * 0.08,
      margin: EdgeInsets.only(
          bottom: size.height * 0.015,
          right: size.height * 0.01,
          left: size.height * 0.01),
      decoration: decorationC1,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: size.width * 0.01),
            width: size.width * 0.1,
            child: const Icon(
              Icons.location_on_outlined,
              size: 40,
              color: Color(0xFF44BEED),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.01, right: size.width * 0.01),
              width: size.width * 0.68,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Modulo Maria Magdalena",
                      style: headlineLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "UV 28, C. Alejandrina - Av. San Lorenzo",
                      style: headlineMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                      width: size.width * 0.68,
                      height: 2.5,
                      margin: EdgeInsets.only(bottom: size.height * 0.002),
                      decoration: decorationC2)
                ],
              )),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.1,
            child: const Icon(
              Icons.follow_the_signs,
              size: 40,
              color: Color(0xFF44BEED),
            ),
          ),
        ],
      ),
    );
  }
}
