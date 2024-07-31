import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderPrimary extends StatelessWidget {
  const HeaderPrimary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  infoMarkerBloc
                      .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 35,
                  color: Color(0xFF44BEED),
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 35,
                  color: Color(0xFF44BEED),
                ))
          ],
        ),
      ),
    );
  }
}
