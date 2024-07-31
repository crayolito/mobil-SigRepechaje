import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final subtitulo = Theme.of(context).textTheme.displayLarge;
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
      color: Colors.white.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFF00A541), width: 4),
    );

    void onTap() async {
      switch (category.typeContent) {
        case InstitutionType.oficinaDistrital:
        case InstitutionType.nrEmergencias:
          Navigator.pushNamed(context, '/${category.rutaDireccion}');
          institutionBloc.add(OnChangedInstitutionType(category.typeContent));
          break;
        case InstitutionType.unidadEducativa:
        case InstitutionType.centroRecreativo:
        case InstitutionType.centroSalud:
        case InstitutionType.centroDeportivo:
        case InstitutionType.puntoTuristico:
        case InstitutionType.centroPolicial:
        case InstitutionType.zonaVecinal:
        case InstitutionType.paradaMicros:
          institutionBloc.add(OnChangedInstitutionType(category.typeContent));
          mapBloc.add(const OnInsertContentMap());
          Navigator.pushNamed(context, '/mapa');
          break;
        default:
          break;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.height * 0.024),
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(category.iconLink)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              textAlign: TextAlign.center,
              category.categoryTitle,
              style: subtitulo,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
