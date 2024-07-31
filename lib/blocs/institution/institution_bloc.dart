import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/institution/helpers.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/optionsAditional.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'institution_event.dart';
part 'institution_state.dart';

class InstitutionBloc extends Bloc<InstitutionEvent, InstitutionState> {
  HelpersInstitution helper = HelpersInstitution();

  InstitutionBloc() : super(InstitutionState()) {
    on<OnChangedInstitutionType>((event, emit) {
      List<OptionsInfo> opcionesInfo = [];
      List<GestionPrueba> informacionAdm = [];
      List<OptionsInfo> opcionesAdm = [];
      // List<OptionAditional> opcionesAdicionales = [];
      emit(state.copyWith(institutionType: event.institutionType));
      desingTypeInsti(event.institutionType);

      opcionesInfo = helper.selectOptionsInfo(event.institutionType);
      informacionAdm = helper.selectInformacionAdm(event.institutionType);
      opcionesAdm =
          helper.selectOptionsAdm(event.institutionType, informacionAdm);
      // opcionesAdicionales =
      // helper.selectOptionsAdicionales(event.institutionType);

      emit(state.copyWith(
        titulo: helper.titleDesignation(event.institutionType),
        checkInitInfo: 0,
        checkInitAdm: 0,
        optionsInfo: opcionesInfo,
        optionsAdm: opcionesAdm,
        // opcionesAdicionales: opcionesAdicionales,
      ));
    });
    on<OnChangedInstEspecial>((event, emit) {
      emit(state.copyWith(isInstEspecial: event.isInstEspecial));
    });
    on<OnChangedInstComun>((event, emit) {
      emit(state.copyWith(isInstComun: event.isInstComun));
    });
    on<OnChangedCoordenadasCategoriaSelect>((event, emit) {
      emit(state.copyWith(
          puntosCategoriaSeleccionada: event.puntosCategoriaSeleccionada));
    });

    on<OnChangedUnidadesEducativas>((event, emit) {
      emit(state.copyWith(unidadesEducativas: event.unidadesEducativas));
    });
  }

  desingTypeInsti(InstitutionType type) {
    switch (type) {
      case InstitutionType.unidadEducativa:
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
      case InstitutionType.paradaMicros:
      case InstitutionType.zonaVecinal:
        add(const OnChangedInstEspecial(false));
        add(const OnChangedInstComun(true));
        break;
      case InstitutionType.oficinaDistrital:
      case InstitutionType.centroPolicial:
      case InstitutionType.puntoTuristico:
        add(const OnChangedInstEspecial(true));
        add(const OnChangedInstComun(false));
      default:
    }
  }
}
