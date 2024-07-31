import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/containerShading.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/institutionInformation.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/optionsScreen.dart';
import 'package:distrito7_mobile/shared/widgets/imagesSwiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutionScreen extends StatelessWidget {
  const InstitutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    List<String> imagenesExample = [
      "https://i.pinimg.com/564x/a5/af/07/a5af07dc6b0a19e622b4afd21abf2325.jpg",
      "https://i.pinimg.com/564x/eb/4b/9e/eb4b9e7e396d7d900cce64819d168e00.jpg",
      "https://i.pinimg.com/564x/10/6f/b4/106fb48b6259e6bae96a53d560fc3aaf.jpg",
      "https://i.pinimg.com/564x/11/62/e2/1162e24bc3d32113531d9988ef67d90e.jpg",
    ];

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // CARRUCEN DE IMAGENES DE LA INSTITUCION
            ImagesSwiper(
              height: size.height * 0.40,
              width: size.width,
              images: imagenesExample,
            ),
            // SOMBREADO DE LA PARTE SUPERIOR
            const ContainerShading(),
            // ICONOS DE RETORNO Y 3D
            const OptionsScreen(),
            // INFORMACION DE LA INSTITUCION
            institutionBloc.state.isInstEspecial
                ? const InstitutionInformation()
                : InstitutionInformation(
                    contextMap: args!['contextMap'],
                  ),
          ],
        ),
      ),
    );
  }
}
