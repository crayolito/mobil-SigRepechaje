import 'package:distrito7_mobile/features/map/presentation/widget/body-window.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/footer-primary.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/header-primary.dart';
import 'package:distrito7_mobile/features/map/presentation/widget/header-secondary.dart';
import 'package:flutter/material.dart';

class WindoInfoCaseta extends StatelessWidget {
  const WindoInfoCaseta({
    super.key,
    required this.contextMap,
  });

  final BuildContext contextMap;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scroolController) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                controller: scroolController,
                child: Column(
                  children: [
                    const HeaderPrimary(),
                    const HeaderSecondary(),
                    const BodyWindown(),
                    FooterPrimary(
                      contextMap: contextMap,
                    )
                  ],
                ),
              ));
        });
  }
}
