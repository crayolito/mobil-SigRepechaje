import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/features/home/presentation/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionsPermissions extends StatelessWidget {
  const OptionsPermissions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titulo = Theme.of(context).textTheme.headlineLarge;
    final permissionBloc =
        BlocProvider.of<PermissionsBloc>(context, listen: true);
    BoxDecoration decorationC1 = BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFF00A541).withOpacity(0.8), width: 4));
    return Positioned(
        top: size.height * 0.55,
        left: 0,
        right: 0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          height: size.height * 0.36,
          decoration: decorationC1,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  'Permisos',
                  style: titulo,
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonOption(
                  icono1: Icons.done_outline_outlined,
                  icono2: Icons.touch_app_outlined,
                  status: permissionBloc.state.isGpsPermissionGranted,
                  onPressed: () {
                    permissionBloc.askGpsAccess();
                  },
                  texto: 'Acceso a la Ubicacion',
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonOption(
                    icono1: Icons.location_on,
                    icono2: Icons.location_off_rounded,
                    status: permissionBloc.state.isGpsEnabled,
                    texto: "Estado del GPS")
              ],
            ),
          ),
        ));
  }
}
