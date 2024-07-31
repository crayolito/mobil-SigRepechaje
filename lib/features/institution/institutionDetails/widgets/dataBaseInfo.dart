import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBaseInformation extends StatelessWidget {
  const DataBaseInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle headlineMedium =
        Theme.of(context).textTheme.headlineMedium!;
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);

    return Column(
      children: [
        IconInformation(
          icon: Icons.fiber_manual_record,
          heightGeneral: (size.height * 0.618) * 0.18,
          widthGeneral: size.width,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          iconSize: 20,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: institutionBloc.state.titulo.toUpperCase(),
              cantLineas: 3,
              data1:
                  "Modulo Santa Teresa de la Bendita Jerarquia de la Santisima Trinidad"),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.fiber_manual_record,
          iconSize: 20,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge,
              bodyText2: headlineMedium,
              titulo: "Direccion",
              cantLineas: 3,
              data1: "C. Melchor Pinto de la Santisima Trinidad, Quito 170150"),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.fiber_manual_record,
          iconSize: 20,
          heightGeneral: (size.height * 0.618) * 0.08,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: headlineLarge, data1: "UV : 58", title: 1),
        ),
      ],
    );
  }
}
