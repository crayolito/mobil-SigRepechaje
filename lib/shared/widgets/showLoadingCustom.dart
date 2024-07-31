import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/config/constants/paleta-colores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowLoadingCustom {
  static void showLoadingProcesoRutas(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BlocListener<TurismoBloc, TurismoState>(
              listener: (context, state) {
                if (state.procesoCambioRuta ==
                    ProcesoCambioRuta.procesoFinalizado) {
                  Navigator.pop(context);
                }
              },
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: kPrimaryColor, width: 3)),
                title: Text(
                  "Espere por favor",
                  textAlign: TextAlign.center,
                  style: estilosText!.titulo2,
                ),
                content: SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.1,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(kSecondaryColor),
                    ),
                  ),
                ),
              ));
        });
  }
}
