import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderSecondary extends StatelessWidget {
  const HeaderSecondary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle displayMedium = Theme.of(context).textTheme.displayMedium!;
    final TextStyle displaySmall = Theme.of(context).textTheme.displaySmall!;
    String? tituloInstitution;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        tituloInstitution = "UNIDAD EDUCATIVA";
        break;
      case InstitutionType.centroSalud:
        tituloInstitution = "CENTRO DE SALUD";
        break;
      case InstitutionType.centroDeportivo:
        tituloInstitution = "CENTRO DEPORTIVO";
        break;
      case InstitutionType.centroPolicial:
        tituloInstitution = "CENTRO POLICIAL";
        break;
      case InstitutionType.centroRecreativo:
        tituloInstitution = "CENTRO RECREATIVO";
        break;
      case InstitutionType.puntoTuristico:
        tituloInstitution = "PUNTO INTERES";
        // tituloInstitution = "PUNTO TURISTICO";
        break;
      case InstitutionType.paradaMicros:
        tituloInstitution = "PARADA DE MICRO";
        break;
      default:
        tituloInstitution = "ZONA VECINAL";
    }

    return Container(
        margin: const EdgeInsets.only(bottom: 6),
        height: size.height * 0.12,
        width: size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(
              0,
              4,
            ),
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: Text(
                tituloInstitution,
                maxLines: 1,
                style: displaySmall,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 3),
                alignment: Alignment.topLeft,
                width: size.width,
                child: Column(
                  children: [
                    Text('Informacion', style: displayMedium),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF44BEED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 3.5,
                      width: size.width * 0.4,
                    )
                  ],
                ))
          ],
        ));
  }
}
