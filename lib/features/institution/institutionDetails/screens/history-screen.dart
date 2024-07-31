import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';

class HistoryInstitution extends StatelessWidget {
  const HistoryInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    final titulo = Theme.of(context).textTheme.labelLarge;
    final body = Theme.of(context).textTheme.labelLarge;

    final size = MediaQuery.of(context).size;

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
        child: Column(children: [
          SafeArea(
            child: Text(
              textAlign: TextAlign.center,
              "HISTORIA",
              style: titulo,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF44BEED),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 2.8,
            width: size.width * 0.4,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
            width: size.width,
            height: size.height * 0.6,
            child: Text(
              '''
En el colegio "Estrella Brillante", cada día era una nueva aventura para los estudiantes. Bajo la dirección de la amable señora Martínez, la escuela se convertía en un espacio de aprendizaje y amistad.
Un día, los estudiantes decidieron dar vida al patio del colegio. Con creatividad y entusiasmo, transformaron los espacios grises en un mural lleno de color y alegría. Cada pincelada contaba una historia de esperanza y unidad.
El patio renovado se convirtió en el punto de encuentro, donde las risas y los secretos se compartían entre juegos y confidencias. La señora Martínez, al presenciar la transformación, comprendió que la verdadera esencia de la educación radica en crear un ambiente donde florezcan la amistad y la creatividad.
Así, el colegio "Estrella Brillante" se convirtió en un lugar donde los sueños cobraban vida, recordándonos que cada pequeño esfuerzo puede generar un impacto positivo en la comunidad educativa.
''',
              textAlign: TextAlign.justify,
              style: body,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
              width: size.width,
              height: size.height * 0.29,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    "https://i.pinimg.com/564x/e1/60/50/e16050edd3b371ccad33c226f08dce92.jpg",
                    fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                        Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
                      width: size.width,
                      height: size.height * 0.29,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/gifLoading/navegador.gif'),
                              fit: BoxFit.cover)),
                    ),
                  );
                }),
              )),
        ]),
      ),
    );
  }
}
