import 'dart:io';

import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLoadingMap(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final style = Theme.of(context).textTheme.displayMedium;
  // Android
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocListener<ComplaintsUeBloc, ComplaintsUeState>(
          listener: (context, estado) {
            if (estado.statusImage == StatusImage.terminado) {
              Navigator.pop(context);
            }
          },
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF44BEED), width: 3),
            ),
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Text(
                    "Espere por favor ...",
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                ),
                Container(
                  height: 3,
                  width: size.width * 0.55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF44BEED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            content: const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF44BEED)),
                ),
              ),
            ),
          ),
        );
      },
    );
    return;
  }

  // iOS
  showCupertinoDialog(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
      title: Text('Espere por favor'),
      content: CupertinoActivityIndicator(),
    ),
  );
}

void showLoadingImagenDenuncia(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final style = Theme.of(context).textTheme.displayMedium;
  // Android
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocListener<ComplaintsUeBloc, ComplaintsUeState>(
          listener: (context, estado) {
            if (estado.statusImage == StatusImage.terminado) {
              Navigator.pop(context);
            }
          },
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF44BEED), width: 3),
            ),
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Text(
                    "Espere mientras su imagen se procesa",
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                ),
                Container(
                  height: 3,
                  width: size.width * 0.55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF44BEED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            content: const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF44BEED)),
                ),
              ),
            ),
          ),
        );
      },
    );
    return;
  }

  // iOS
  showCupertinoDialog(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
      title: Text('Espere por favor'),
      content: CupertinoActivityIndicator(),
    ),
  );
}

void showLoadingMessageIA(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final style = Theme.of(context).textTheme.displayMedium;
  // Android
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final complaintsUeBloc =
            BlocProvider.of<ComplaintsUeBloc>(context, listen: true);
        return BlocListener<ComplaintsUeBloc, ComplaintsUeState>(
          listener: (context, estado) {
            if (estado.statusComplaintsUE == StatusComplaintsUE.terminado) {}
          },
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF44BEED), width: 3),
            ),
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: Text(
                    complaintsUeBloc.state.mensageIA,
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                ),
                Container(
                  height: 3,
                  width: size.width * 0.55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF44BEED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: complaintsUeBloc.state.statusComplaintsUE ==
                        StatusComplaintsUE.terminado
                    ? Center(
                        child: complaintsUeBloc.state.statusComplaintsUE ==
                                StatusComplaintsUE.terminado
                            ? IconButton(
                                icon: Icon(
                                  Icons.check,
                                  color: Color(0xFF44BEED),
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  // Aquí colocas lo que quieres que suceda cuando el botón sea presionado
                                  print("Botón presionado");
                                },
                              )
                            : CircularProgressIndicator(
                                strokeWidth: 5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF44BEED)),
                              ),
                      )
                    : CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF44BEED)),
                      ),
              ),
            ),
          ),
        );
      },
    );
    return;
  }

  // iOS
  showCupertinoDialog(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
      title: Text('Espere por favor'),
      content: CupertinoActivityIndicator(),
    ),
  );
}
