import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageNetPersonalized extends StatelessWidget {
  const ImageNetPersonalized({super.key, required this.urlImage});
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final permissionsBloc =
        BlocProvider.of<PermissionsBloc>(context, listen: true);
    return permissionsBloc.state.isInternetEnabled
        ? Image.network(
            urlImage,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Image.asset(
                "assets/gifLoading/navegador.gif",
                fit: BoxFit.cover,
              );
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Image.asset(
                "assets/lento.gif",
                fit: BoxFit.cover,
              );
            },
          )
        : Image.asset(
            "assets/lento.gif",
            fit: BoxFit.cover,
          );
  }
}
