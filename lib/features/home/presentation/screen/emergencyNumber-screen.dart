import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/data/nrEmergencia.dart';
import 'package:distrito7_mobile/data/nrEmergencias-data.dart';
import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNumbers extends StatelessWidget {
  const EmergencyNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titulo = Theme.of(context).textTheme.bodyMedium;
    BoxDecoration decoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFF00A541), width: 4));
    return Scaffold(
      floatingActionButton: const ButtonCloseScreen(),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
                child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              width: size.width,
              height: size.height * 0.07,
              decoration: decoration,
              child: Text(
                "Nr Emergencias",
                style: titulo,
              ),
            )),
            SizedBox(
                width: size.width,
                height: size.height * 0.891,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: nrEmergency.length,
                          itemBuilder: (context, index) {
                            final emergency = nrEmergency[index];
                            return FadeInLeft(
                                child: ItemNrEmergency(nrEmergency: emergency));
                          },
                        ),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}

class ItemNrEmergency extends StatelessWidget {
  const ItemNrEmergency({super.key, required this.nrEmergency});

  final NrEmergencia nrEmergency;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      width: size.width,
      height: size.height * 0.12,
      child: GestureDetector(
        onTap: () async {
          Uri dialNumber = Uri(scheme: 'tel', path: nrEmergency.nrTelefono);
          await launchUrl(dialNumber);
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: size.width * 0.15,
              child: Container(
                width: size.width * 0.76,
                height: (size.height * 0.12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                  border: Border.all(color: const Color(0xFF44BEED), width: 3),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.085),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      nrEmergency.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (size.height * 0.12) * 0.12,
              left: size.width * 0.03,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width * 0.2,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Image(image: AssetImage(nrEmergency.image)),
              ),
            ),
            Positioned(
              right: size.width * 0.03,
              top: size.height * 0.03,
              child: Container(
                width: size.width * 0.13,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: const Icon(
                  Icons.call,
                  color: Color(0xFF44BEED),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
