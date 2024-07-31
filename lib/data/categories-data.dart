import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/categories.dart';
import 'package:flutter/material.dart';

class OptionsInfo {
  final int idInit;
  final String iconLink;
  final Widget view;

  OptionsInfo({
    required this.idInit,
    required this.iconLink,
    required this.view,
  });
}

List<Category> categoriesList = [
  Category(
      categoryTitle: 'Oficina Distrital',
      typeContent: InstitutionType.oficinaDistrital,
      iconLink: "assets/categorias/subAlcaldia.png",
      rutaDireccion: "subAlcaldia"),
  Category(
      categoryTitle: 'Telefonos Urgencias',
      typeContent: InstitutionType.nrEmergencias,
      iconLink: "assets/categorias/emergencias.png",
      rutaDireccion: "emergencias"),
  Category(
      categoryTitle: 'Unidades Educativas',
      typeContent: InstitutionType.unidadEducativa,
      iconLink: "assets/categorias/colegio.png",
      rutaDireccion: "unidadEducativa"),
  Category(
      categoryTitle: 'Centros Recreativos',
      typeContent: InstitutionType.centroRecreativo,
      iconLink: "assets/categorias/teatro.png",
      rutaDireccion: "centroRecreativo"),
  Category(
      categoryTitle: 'Centros Salud',
      typeContent: InstitutionType.centroSalud,
      iconLink: 'assets/categorias/hospital.png',
      rutaDireccion: "centroSalud"),
  Category(
      categoryTitle: 'Centros Deportivos',
      typeContent: InstitutionType.centroDeportivo,
      iconLink: 'assets/categorias/deporte.png',
      rutaDireccion: "centroDeportivo"),
  Category(
      categoryTitle: 'Puntos Interes',
      typeContent: InstitutionType.puntoTuristico,
      iconLink: 'assets/categorias/turismo.png',
      rutaDireccion: "puntoTuristico"),
  Category(
      categoryTitle: 'Centros Policiales',
      typeContent: InstitutionType.centroPolicial,
      iconLink: 'assets/categorias/estacion-de-policia.png',
      rutaDireccion: "centroPolicial"),
  Category(
      categoryTitle: 'Zonas Vecinales',
      typeContent: InstitutionType.zonaVecinal,
      iconLink: 'assets/categorias/residencial.png',
      rutaDireccion: "zonaVecinal"),
  Category(
      categoryTitle: 'Paradas Micros',
      typeContent: InstitutionType.paradaMicros,
      iconLink: 'assets/categorias/paradaMicros.png',
      rutaDireccion: "paradaMicro")
];
