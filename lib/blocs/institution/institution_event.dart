part of 'institution_bloc.dart';

class InstitutionEvent extends Equatable {
  const InstitutionEvent();

  @override
  List<Object> get props => [];
}

class OnChangedInstitutionType extends InstitutionEvent {
  final InstitutionType institutionType;
  const OnChangedInstitutionType(this.institutionType);
}

class OnChangedInstComun extends InstitutionEvent {
  final bool isInstComun;
  const OnChangedInstComun(this.isInstComun);
}

class OnChangedInstEspecial extends InstitutionEvent {
  final bool isInstEspecial;
  const OnChangedInstEspecial(this.isInstEspecial);
}

class OnChangedCoordenadasCategoriaSelect extends InstitutionEvent {
  final Map<String, LatLng> puntosCategoriaSeleccionada;
  const OnChangedCoordenadasCategoriaSelect(this.puntosCategoriaSeleccionada);
}

class OnChangedUnidadesEducativas extends InstitutionEvent {
  final List<Colegio> unidadesEducativas;
  const OnChangedUnidadesEducativas(this.unidadesEducativas);
}