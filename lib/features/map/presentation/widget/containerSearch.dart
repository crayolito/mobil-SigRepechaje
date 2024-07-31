import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    super.key,
    required this.subtitulo,
  });

  final TextStyle? subtitulo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    return Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.045,
            left: size.width * 0.03,
            right: size.width * 0.03),
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, "/searchIntitution",
            // arguments: {'contextMap': context});

            Navigator.pushNamed(context, "/searchSIG");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: size.width,
            height: size.height * 0.056,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 35,
                  color: const Color(0xFF00A541).withOpacity(0.8),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                    child: Text(
                  institutionBloc.state.titulo.toUpperCase(),
                  style: subtitulo,
                ))
              ],
            ),
          ),
        ));
  }
}
