import 'package:distrito7_mobile/features/home/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    BoxDecoration decoration = const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fondo/inicioScreen.jpg"),
            fit: BoxFit.cover));
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: decoration,
        child: const Stack(
          children: [
            // CONTAINER DE OPCIONES REQUERIDAS PARA EL ACCESO
            OptionsPermissions(),
            // BOTON PARA CONTINUAR AL SIGUIENTE SCREEN
            BottonAccess()
          ],
        ),
      ),
    );
  }
}
