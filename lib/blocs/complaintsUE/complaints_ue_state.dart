part of 'complaints_ue_bloc.dart';

enum StatusComplaintsUE { empezando, procesando, terminado }

enum StatusImage { empezando, procesando, terminado }

class ComplaintsUeState extends Equatable {
  final StatusComplaintsUE statusComplaintsUE;
  final StatusImage statusImage;
  final String imagenDenuncia;
  final String mensageIA;

  const ComplaintsUeState({
    this.statusComplaintsUE = StatusComplaintsUE.empezando,
    this.statusImage = StatusImage.empezando,
    this.imagenDenuncia = "assets/gifLoading/insertImage.jpg",
    this.mensageIA = "Se esta procesando su denuncia",
  });

  ComplaintsUeState copyWith({
    StatusComplaintsUE? statusComplaintsUE,
    StatusImage? statusImage,
    String? imagenDenuncia,
    String? mensageIA,
  }) {
    return ComplaintsUeState(
      statusComplaintsUE: statusComplaintsUE ?? this.statusComplaintsUE,
      statusImage: statusImage ?? this.statusImage,
      imagenDenuncia: imagenDenuncia ?? this.imagenDenuncia,
      mensageIA: mensageIA ?? this.mensageIA,
    );
  }

  @override
  List<Object> get props => [
        statusComplaintsUE,
        statusImage,
        imagenDenuncia,
        mensageIA,
      ];
}
