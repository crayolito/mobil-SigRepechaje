import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';

class Category {
  final String categoryTitle;
  final InstitutionType typeContent;
  final String iconLink;
  final String rutaDireccion;

  Category({
    required this.rutaDireccion,
    required this.categoryTitle,
    required this.typeContent,
    required this.iconLink,
  });
}
