import 'package:distrito7_mobile/features/home/presentation/screen/EmergencyNumber-screen.dart';
import 'package:distrito7_mobile/features/home/presentation/screen/categories-screen.dart';
import 'package:distrito7_mobile/features/home/presentation/screen/welcome-screen.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/screens/complaint-formulario-screen.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/screens/history-screen.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/screens/instittutionScreen.dart';
import 'package:distrito7_mobile/features/map/presentation/screen/map-sceen.dart';
import 'package:distrito7_mobile/features/search/search/search-screen.dart';
import 'package:distrito7_mobile/features/search/search/searchsig.screen.dart';
import 'package:distrito7_mobile/features/view/imageVR.dart';
import 'package:distrito7_mobile/features/view/videoVR.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  // HOME
  '/': (_) => const WelcomeScreen(),
  // '/': (_) => MiWidget(),
  '/categories': (_) => const CategoriesScreen(),
  // MAPA
  '/mapa': (_) => const MapScreen(),
  // INSTITUTION
  '/subAlcaldia': (_) => const InstitutionScreen(),
  '/emergencias': (_) => const EmergencyNumbers(),
  '/searchIntitution': (_) => const SearchScreen(),
  '/infoInstitution': (_) => const InstitutionScreen(),
  '/historiaInsti': (_) => const HistoryInstitution(),
  '/imageVR360': (_) => const Image360View(),
  '/videoVR360': (_) => const Video360ViewPersonalized(),
  '/complaintsUE': (_) => const ComplaintFormularioScreen(),
  '/searchSIG': (_) => const SearchScreenSIG(),
};
