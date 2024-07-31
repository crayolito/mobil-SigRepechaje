import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPrimary extends StatelessWidget {
  const FooterPrimary({super.key, required this.contextMap});

  final BuildContext contextMap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final complaintsUeBloc = BlocProvider.of<ComplaintsUeBloc>(context);
    return Container(
      height: size.height * 0.08,
      width: size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 4,
          offset: const Offset(
            0,
            -4,
          ),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialMediaButton(
            icon: FontAwesomeIcons.locationDot,
            onPressed: () async {
              await launchUrl(
                  Uri.parse('https://maps.app.goo.gl/sk7HDf8RJbCDz5oy6'));
            },
          ),
          SocialMediaButton(
            icon: Icons.report_gmailerrorred_outlined,
            onPressed: () async {
              if (institutionBloc.state.institutionType ==
                  InstitutionType.unidadEducativa) {
                Navigator.pushNamed(
                  context,
                  "/complaintsUE",
                );
                return;
              }
              await launchUrl(Uri.parse(
                  'https://docs.google.com/forms/d/e/1FAIpQLScuz0ViZ5h6D6iSLK5iX8Usq2Ktd3UE9GqlJNBJbM6b0020rA/viewform'));
            },
          ),
          SocialMediaButton(
            icon: Icons.copy_sharp,
            onPressed: () async {
              Navigator.pushNamed(context, "/infoInstitution",
                  arguments: {'contextMap': contextMap});
            },
          )
        ],
      ),
    );
  }
}

// Boton de Redes Sociales
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SocialMediaButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF44BEED)),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ));
  }
}
