import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/data/objetoAuxData.dart';
import 'package:distrito7_mobile/shared/components/components.dart';

class HelpersInstitution {
  String titleDesignation(InstitutionType type) {
    switch (type) {
      case InstitutionType.unidadEducativa:
        return 'Unidad Educativa';
      case InstitutionType.centroSalud:
        return 'Centro de Salud';
      case InstitutionType.centroDeportivo:
        return 'Centro Deportivo';
      case InstitutionType.centroRecreativo:
        return 'Centro Recreativo';
      case InstitutionType.centroPolicial:
        return 'Centro Policial';
      case InstitutionType.puntoTuristico:
        return 'Punto Interes';
      // return 'Punto Turistico';
      case InstitutionType.paradaMicros:
        return 'Parada de Micros';
      case InstitutionType.zonaVecinal:
        return 'Busca Aquí';
      default:
        return 'Institucion Publica';
    }
  }

  List<OptionsInfo> selectOptionsInfo(InstitutionType type) {
    List<OptionsInfo> opcionesInfo = [];
    switch (type) {
      case InstitutionType.unidadEducativa:
        opcionesInfo = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/renovacion.png",
              view: AreaCareList(mantenimiento: mantenimientosUE)),
          OptionsInfo(
              idInit: 1,
              iconLink: "assets/infoScreen/tecnologia.png",
              view: TechnologyList(
                  suministros: suministrosEducacion,
                  desayuno: desayunosSemana)),
          OptionsInfo(
              idInit: 2,
              iconLink: "assets/infoScreen/visitas.png",
              view: VisitList(visita: visitasEducacion))
        ];
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
        opcionesInfo = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/tecnologia.png",
              view: TechnologyList(
                  suministros: suministrosHospitales, desayuno: const [])),
          OptionsInfo(
              idInit: 1,
              iconLink: "assets/infoScreen/visitas.png",
              view: VisitList(visita: visitasHospitales))
        ];
        break;
      case InstitutionType.centroPolicial:
      case InstitutionType.puntoTuristico:
      case InstitutionType.paradaMicros:
      case InstitutionType.zonaVecinal:
      //
      case InstitutionType.none:
      case InstitutionType.nrEmergencias:
      case InstitutionType.oficinaDistrital:
        opcionesInfo = [];
        break;
      default:
        opcionesInfo = [];
        break;
    }
    return opcionesInfo;
  }

  List<GestionPrueba> selectInformacionAdm(InstitutionType type) {
    List<GestionPrueba> informacionAdm = [];
    switch (type) {
      case InstitutionType.unidadEducativa:
        informacionAdm = List.from(gestionDataUD);
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
        informacionAdm = List.from(gestionDataCM);
        break;
      case InstitutionType.centroPolicial:
      case InstitutionType.puntoTuristico:
      case InstitutionType.paradaMicros:
      case InstitutionType.zonaVecinal:
      case InstitutionType.none:
      case InstitutionType.nrEmergencias:
      case InstitutionType.oficinaDistrital:
        informacionAdm = [];
        break;
      default:
        informacionAdm = [];
        break;
    }
    return informacionAdm;
  }

  List<OptionsInfo> selectOptionsAdm(
      InstitutionType type, List<GestionPrueba> informacionAdm) {
    List<OptionsInfo> opcionesAdm = [];

    switch (type) {
      case InstitutionType.unidadEducativa:
        opcionesAdm = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/turnoMañana.png",
              view: ItemInformationShift(infoGestion: informacionAdm[0])),
          OptionsInfo(
              idInit: 1,
              iconLink: "assets/infoScreen/turnoTarde.png",
              view: ItemInformationShift(infoGestion: informacionAdm[1])),
          OptionsInfo(
              idInit: 2,
              iconLink: "assets/infoScreen/turnoNoche.png",
              view: ItemInformationShift(infoGestion: informacionAdm[2])),
        ];
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
        opcionesAdm = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/Directiva.png",
              view: ItemInformationShift(infoGestion: informacionAdm[0])),
          OptionsInfo(
              idInit: 1,
              iconLink: "assets/infoScreen/servicioPublico.png",
              view: const ItemServicePublic()),
        ];
      case InstitutionType.oficinaDistrital:
      case InstitutionType.puntoTuristico:
      case InstitutionType.centroPolicial:
        opcionesAdm = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/servicioPublico.png",
              view: const ItemServicePublic()),
        ];
      case InstitutionType.paradaMicros:
      case InstitutionType.zonaVecinal:
      case InstitutionType.none:
      case InstitutionType.nrEmergencias:
        opcionesAdm = [];
        break;
      default:
        opcionesAdm = [];
        break;
    }
    return opcionesAdm;
  }
}
