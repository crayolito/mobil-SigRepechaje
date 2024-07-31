import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/unidad-educativa.dart';
import 'package:distrito7_mobile/features/home/domain/entities/colegio.dart';
import 'package:equatable/equatable.dart';

part 'info_marker_event.dart';
part 'info_marker_state.dart';

class InfoMarkerBloc extends Bloc<InfoMarkerEvent, InfoMarkerState> {
  final InstitutionBloc institutionBloc;
  InfoMarkerBloc({
    required this.institutionBloc,
  }) : super(const InfoMarkerState()) {
    on<OnChangeViewInfo>((event, emit) {
      emit(state.copyWith(viewInfo: event.viewInfo));
    });

    on<OnChangeInfoStand>((event, emit) {
      emit(state.copyWith(infoStand: event.infoStand));
    });

    on<OnSelectInstitution>((event, emit) {
      String aux = event.id;
      String ultimoCaracter = aux[aux.length - 1];
      int numero = int.parse(ultimoCaracter);
      Colegio unidadEducativa =
          institutionBloc.state.unidadesEducativas[numero];
      InstitutionSelect institutionSelect = InstitutionSelect(
          nombre: unidadEducativa.nombre,
          direccion: unidadEducativa.direccion,
          direccionReferencial: unidadEducativa.direccion);
      emit(state.copyWith(
        indexInstitutionSelect: numero,
        viewInfo: true,
        infoStand: institutionSelect,
      ));
    });
  }
}
