import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/dataBaseInfo.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/institutionInformation.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/titleBase.dart';
import 'package:distrito7_mobile/shared/widgets/DropDownInfoBloc.dart';
import 'package:distrito7_mobile/shared/widgets/additionalOptions.dart';
import 'package:flutter/material.dart';

class CommonInstitution extends StatelessWidget {
  const CommonInstitution({
    super.key,
    required this.institutionBloc,
    required ScrollController scrollController,
    required this.widget,
  }) : _scrollController = scrollController;

  final InstitutionBloc institutionBloc;
  final ScrollController _scrollController;
  final InstitutionInformation widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titulo Principal
        const TitleDateFirst(),
        // Datos Principales
        const DataBaseInformation(),
        // Datos Adicionales : Cuidados de la Institucion - Tecnologia - Visitas Gubernamentales
        DropDownInfoBloc(
          checkIS: institutionBloc.state.checkInitInfo,
          optionsInfo: institutionBloc.state.optionsInfo,
          onTap: () {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  280,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                );
              }
            });
          },
        ),
        // Informacion Turnos Administrativos
        DropDownInfoBloc(
          checkIS: institutionBloc.state.checkInitAdm,
          optionsInfo: institutionBloc.state.optionsAdm,
          onTap: () {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                );
              }
            });
          },
        ),
        // OPCIONES ADICIONALES
        AdditionalOptions(
          scrollController: _scrollController,
          contextMap: widget.contextMap,
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
