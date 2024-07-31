import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottonAccess extends StatelessWidget {
  const BottonAccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);
    final permissionBloc =
        BlocProvider.of<PermissionsBloc>(context, listen: true);
    BoxDecoration decoration = BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.8),
        border: Border.all(
            color: const Color(0xFF00A541).withOpacity(0.8), width: 5));

    return Positioned(
        top: size.height * 0.84,
        left: size.width * 0.37,
        child: Container(
            width: size.width * 0.22,
            height: size.height * 0.13,
            padding: const EdgeInsets.all(8),
            decoration: decoration,
            child: GestureDetector(
              onTap: () {
                turismoBloc.add(const OnGetPuntosCorte());
                Navigator.pushNamed(context, '/categories');
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: permissionBloc.state.isGpsPermissionAndGpsEnabled
                      ? const Color(0xFF00A541)
                      : const Color.fromRGBO(255, 33, 38, 1.0)
                          .withOpacity(0.85),
                ),
                child: Icon(
                    permissionBloc.state.isGpsPermissionAndGpsEnabled
                        ? Icons.navigate_next
                        : Icons.lock_clock,
                    size: 50,
                    color: permissionBloc.state.isGpsPermissionAndGpsEnabled
                        ? Colors.white.withOpacity(0.8)
                        : const Color(0xFF44BEED)),
              ),
            )));
  }
}
