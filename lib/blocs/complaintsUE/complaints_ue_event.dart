part of 'complaints_ue_bloc.dart';

class ComplaintsUeEvent extends Equatable {
  const ComplaintsUeEvent();

  @override
  List<Object> get props => [];
}

class OnChangedStatusComplaintsUE extends ComplaintsUeEvent {
  final StatusComplaintsUE statusComplaintsUE;
  const OnChangedStatusComplaintsUE({required this.statusComplaintsUE});
}

class OnChangedStatusImage extends ComplaintsUeEvent {
  final StatusImage statusImage;
  const OnChangedStatusImage({required this.statusImage});
}

class OnChagedImagenDenuncia extends ComplaintsUeEvent {
  final String imagenDenuncia;
  const OnChagedImagenDenuncia({required this.imagenDenuncia});
}

class OnProcessCargaImage extends ComplaintsUeEvent {
  final String filePath;
  const OnProcessCargaImage({
    required this.filePath,
  });
}

class OnProcessaDenuncia extends ComplaintsUeEvent {
  final String texto;
  final int idUnidadEducativa;
  const OnProcessaDenuncia(
      {required this.texto, required this.idUnidadEducativa});
}


class OnChangedMenesajeIA extends ComplaintsUeEvent {
  final String mensageIA;
  const OnChangedMenesajeIA({required this.mensageIA});
}