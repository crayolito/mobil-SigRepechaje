import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:equatable/equatable.dart';

part 'turismo_event.dart';
part 'turismo_state.dart';

class TurismoBloc extends Bloc<TurismoEvent, TurismoState> {
  TurismoBloc() : super(TurismoState()) {
    on<OnSelectPuntoInteres>((event, emit) {
      emit(state.copyWith(showPuntoInteres: event.puntoInteres));
    });

    on<OnChangedFiltroRutaCorte>((event, emit) {
      emit(state.copyWith(
        tipoTransporte: event.tipoTransporte ?? state.tipoTransporte,
        tipoTrafico: event.nivelTrafico ?? state.tipoTrafico,
        tipoRuta: event.tipoRuta ?? state.tipoRuta,
        showAlternativa: event.showAlternativa ?? state.showAlternativa,
      ));
    });

    on<OnFiltroViewClienteDPC>((event, emit) {
      final verCliente = state.puntosInteresCliente
          .where((element) => element.nombre
              .toLowerCase()
              .contains(event.filtroViewCliente.toLowerCase()))
          .toList();
      emit(state.copyWith(puntosInteresCliente: verCliente));
    });

    on<OnResetViewClienteDPC>((event, emit) {
      emit(state.copyWith(
          puntosInteresCliente: state.puntosInteresBackend,
          puntosInteresSeleccionado: []));
    });

    on<OnGetPuntosCorte>((event, emit) {
      emit(state.copyWith(
        puntosInteresBackend: puntosInterestD7,
        puntosInteresCliente: puntosInterestD7,
      ));
    });

    on<OnChangedRouteSelect>((event, emit) {
      // Especificar el tipo de las listas para asegurar la compatibilidad de tipos
      List<PuntosInteres> elementosViewCliente = [
        ...state.puntosInteresCliente
      ];

      final elementoNuevo = PuntosInteres(
        select: !elementosViewCliente[event.index].select,
        nombre: elementosViewCliente[event.index].nombre,
        longitud: elementosViewCliente[event.index].longitud,
        latitud: elementosViewCliente[event.index].latitud,
        uv: elementosViewCliente[event.index].uv,
        direccion: elementosViewCliente[event.index].direccion,
        typeInstitution: elementosViewCliente[event.index].typeInstitution,
      );

      // Actualizar el estado de selección de los elementos correspondientes
      elementosViewCliente[event.index] = elementoNuevo;

      if (!state.puntosInteresSeleccionado.contains(event.puntoInteres)) {
        // Emitir el nuevo estado con las listas actualizadas
        emit(state.copyWith(
            puntosInteresCliente: elementosViewCliente,
            puntosInteresSeleccionado: [
              event.puntoInteres,
              ...state.puntosInteresSeleccionado
            ]));
      }
    });

    on<OnChangedRutasGoogleApi>((event, emit) {
      emit(state.copyWith(rutasGoogleApi: event.rutasGoogleApi));
    });
  }
}
