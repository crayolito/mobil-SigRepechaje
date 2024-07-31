import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/repostiories/institution_repository_impl.dart';
import 'package:distrito7_mobile/features/institution/services/camera_gallery_service_impl.dart';
import 'package:equatable/equatable.dart';

part 'complaints_ue_event.dart';
part 'complaints_ue_state.dart';

class ComplaintsUeBloc extends Bloc<ComplaintsUeEvent, ComplaintsUeState> {
  final InfoMarkerBloc infoMarkerBloc;
  final institutionRepositoryImpl = InstitutionRepositoryImpl();
  ComplaintsUeBloc({
    required this.infoMarkerBloc,
  }) : super(const ComplaintsUeState()) {
    on<OnChangedStatusComplaintsUE>((event, emit) {
      emit(state.copyWith(
        statusComplaintsUE: event.statusComplaintsUE,
      ));
    });

    on<OnProcessCargaImage>((event, emit) async {
      var url = await CameraGalleryServiceImpl.uploadImageToCloudinary(
          event.filePath);
      emit(state.copyWith(
        statusImage: StatusImage.terminado,
        imagenDenuncia: url ?? state.imagenDenuncia,
      ));
    });

    on<OnChagedImagenDenuncia>((event, emit) {
      emit(state.copyWith(
        imagenDenuncia: event.imagenDenuncia,
      ));
    });

    on<OnProcessaDenuncia>((event, emit) async {
      var response = await institutionRepositoryImpl.procesarDenuncia(
          event.texto, state.imagenDenuncia, event.idUnidadEducativa);
//
      if (response == "No puede mandar imagenes obcenas") {
        emit(state.copyWith(
          statusComplaintsUE: StatusComplaintsUE.terminado,
          mensageIA: "No puede mandar imagenes obcenas",
        ));
      } else {
        emit(state.copyWith(
          statusComplaintsUE: StatusComplaintsUE.terminado,
          mensageIA: "Denuncia Procesada con Exito",
        ));
      }
    });

    on<OnChangedMenesajeIA>((event, emit) {
      emit(state.copyWith(
        mensageIA: event.mensageIA,
      ));
    });

    on<OnChangedStatusImage>((event, emit) {
      emit(state.copyWith(
        statusImage: event.statusImage,
      ));
    });
  }
}
