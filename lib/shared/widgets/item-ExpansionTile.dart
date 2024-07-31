import 'package:flutter/material.dart';

class ElementosExpansionTile extends StatelessWidget {
  const ElementosExpansionTile({
    super.key,
    required this.icon,
    required this.sizeP,
    required this.data1,
    required this.data2,
  });

  final IconData icon;
  final Size sizeP;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    // ignore: deprecated_member_use
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        width: sizeP.width,
        height: sizeP.height * 0.07,
        child: Row(
          children: [
            SizedBox(
              width: sizeP.width * 0.1,
              child: Icon(
                icon,
                color: const Color(0xFF44BEED),
                size: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              width: sizeP.width * 0.86,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data1,
                    style: headlineLarge,
                  ),
                  Text(
                    data2,
                    style: headlineMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
