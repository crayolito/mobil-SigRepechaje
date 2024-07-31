import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/permissions/helpers.dart';
import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/config/constants/estilosLetras.constants.dart';
import 'package:distrito7_mobile/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final internetChecker = CheckInternetConnection();
EstilosLetras? estilosText;

void main() async {
  runApp(MultiBlocProvider(providers: [
    // READ: SOLO POR SIG
    BlocProvider(create: (context) => TurismoBloc()),
    BlocProvider(create: (context) => PermissionsBloc()),
    BlocProvider(create: (context) => LocationBloc()),
    BlocProvider(create: (context) => InstitutionBloc()),
    BlocProvider(
        create: (context) => InfoMarkerBloc(
              institutionBloc: BlocProvider.of<InstitutionBloc>(context),
            )),
    BlocProvider(
        create: (context) => MapBloc(
              turismoBloc: BlocProvider.of<TurismoBloc>(context),
              institutionBloc: BlocProvider.of<InstitutionBloc>(context),
              locationBloc: BlocProvider.of<LocationBloc>(context),
              infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(context),
            )),
    BlocProvider(
        create: (context) => ComplaintsUeBloc(
            infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(context)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    estilosText = EstilosLetras(context);

    return MaterialApp(
      theme: ThemeData(
        primaryColor:
            const Color(0xFF00A541), // Color principal de la aplicación
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color(0xFF00A541),
            ),
            foregroundColor: WidgetStateProperty.all(
              const Color(0xFF00A541),
            ),
          ),
        ),
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          bodyLarge: TextStyle(
            fontSize: 40,
            // color: Colors.white,
            color: Color(0xFF44BEED),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          // ignore: deprecated_member_use
          bodyMedium: TextStyle(
            fontSize: 30,
            // color: Colors.white,
            color: Color(0xFF44BEED),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          bodySmall: TextStyle(
            fontSize: 20,
            // color: Colors.white,
            color: Color(0xFF44BEED),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          displayLarge: TextStyle(
            fontSize: 20,
            // color: Colors.white,
            color: Color(0xFF44BEED),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            // color: Colors.white,
            color: const Color(0xFF00A541),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          displaySmall: TextStyle(
            fontSize: 30,
            color: const Color(0xFF00A541),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          headlineLarge: TextStyle(
            fontSize: 18,
            color: const Color(0xFF00A541),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00A541),
            fontFamily: 'Times New Roman',
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            color: const Color(0xFF00A541),
            fontFamily: 'Times New Roman',
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            color: Color(0xFF44BEED),
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
          ),
        ),
      ),
      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
