import 'dart:async';

import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/config/constants/paleta-colores.dart';
import 'package:distrito7_mobile/config/constants/shadow.constant.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({
    super.key,
  });

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final myController = TextEditingController();
  Timer? _debounce;
  @override
  void dispose() {
    myController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    return Positioned(
        top: size.height * 0.12,
        right: size.width * 0.05,
        left: size.width * 0.05,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          height: size.height * 0.075,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: size.width * 0.09,
                color: kSecondaryColor,
                shadows: shadowKP,
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.01),
                width: size.width * 0.661,
                child: TextFormField(
                  controller: myController,
                  style: estilosText!.titulo3,
                  decoration: InputDecoration(
                    hintStyle: estilosText!.titulo3,
                    hintText: 'Buscar ...',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      turismoBloc.add(OnFiltroViewClienteDPC(value));
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  myController.clear();
                  turismoBloc.add(const OnResetViewClienteDPC());
                  mapBloc.add(const OnInsertContentMap());
                },
                child: Icon(
                  Icons.cancel_outlined,
                  size: size.width * 0.07,
                  color: kSecondaryColor,
                  shadows: shadowKP,
                ),
              ),
            ],
          ),
        ));
  }
}