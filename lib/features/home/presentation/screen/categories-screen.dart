import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/features/home/presentation/widget/widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo/categoriasScreen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            // CATEGORIAS DE OFRECE DISTRITO 7
            CategoriesContainer(),
            // TITULO DE PRESENTACION SCREEN
            PresentationContainer(),
          ],
        ),
      ),
    );
  }
}

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.33,
        left: 0,
        right: 0,
        child: SizedBox(
          width: size.width,
          height: size.height * 0.665,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: categoriesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                final category = categoriesList[index];
                return FadeInLeft(child: ItemCategory(category: category));
              }),
        ));
  }
}
