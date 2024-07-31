import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/config/constants/constantes.dart';
import 'package:distrito7_mobile/config/constants/paleta-colores.dart';
import 'package:distrito7_mobile/features/institution/services/camera_gallery_service_impl.dart';
import 'package:distrito7_mobile/helper/show_loading_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintFormularioScreen extends StatefulWidget {
  const ComplaintFormularioScreen({super.key});

  @override
  State<ComplaintFormularioScreen> createState() =>
      _ComplaintFormularioScreenState();
}

class _ComplaintFormularioScreenState extends State<ComplaintFormularioScreen> {
  ComplaintsUeBloc? complaintsUeBloc;
  String contextoDenuncia = "";

  @override
  void initState() {
    super.initState();
    complaintsUeBloc =
        BlocProvider.of<ComplaintsUeBloc>(context, listen: false);
  }

  @override
  void dispose() {
    complaintsUeBloc!.add(const OnChagedImagenDenuncia(
        imagenDenuncia: "assets/gifLoading/insertImage.jpg"));
    complaintsUeBloc!.add(const OnChangedStatusComplaintsUE(
        statusComplaintsUE: StatusComplaintsUE.empezando));
    complaintsUeBloc!
        .add(const OnChangedStatusImage(statusImage: StatusImage.empezando));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final complaintsUeBloc =
        BlocProvider.of<ComplaintsUeBloc>(context, listen: true);
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);
    final unidadEducativa = institutionBloc
        .state.unidadesEducativas[infoMarkerBloc.state.indexInstitutionSelect];
    final size = MediaQuery.of(context).size;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const NetworkImage(
                      "https://i.pinimg.com/564x/3c/74/98/3c74985ba2a1e4b094cd9f8047b99b49.jpg"),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.025,
                      ),
                      alignment: Alignment.centerLeft,
                      width: size.width * 0.9,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kTerciaryColor.withOpacity(0.8),
                        border: Border.all(color: kSecondaryColor, width: 3),
                      ),
                      child: Text(
                        unidadEducativa.nombre,
                        style: GoogleFonts.anta(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: size.height * 0.02),
                  CustomTextArea(
                    onChanged: (String value) {
                      setState(() {
                        contextoDenuncia = value;
                      });
                    },
                    height: size.height * 0.23,
                    width: size.width * 0.9,
                    titulo: "¿De que trata su denuncia?",
                  ),
                  SizedBox(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () async {
                      showLoadingMessageIA(context);
                      final photoPath =
                          await CameraGalleryServiceImpl().takePhoto();
                      if (photoPath == null) return;
                      complaintsUeBloc
                          .add(OnProcessCargaImage(filePath: photoPath));
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.45,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.025,
                          vertical: size.height * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kSecondaryColor, width: 3),
                      ),
                      child: complaintsUeBloc.state.imagenDenuncia ==
                              "assets/gifLoading/insertImage.jpg"
                          ? Image.asset('assets/gifLoading/insertImage.jpg',
                              fit: BoxFit
                                  .cover) // Usa Image.asset para AssetImage
                          : Image.network(complaintsUeBloc.state.imagenDenuncia,
                              fit: BoxFit
                                  .cover), // Usa Image.network para NetworkImage
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.89,
                left: size.width * 0.28,
                child: Container(
                  width: size.width * 0.40,
                  height: size.height * 0.1,
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () async {
                            showLoadingMessageIA(context);
                            complaintsUeBloc.add(OnProcessaDenuncia(
                                texto: contextoDenuncia,
                                idUnidadEducativa: unidadEducativa.id));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.fileImport,
                            size: 40,
                            color: Colors.black,
                            shadows: shadowPPN3,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            FontAwesomeIcons.ban,
                            size: 40,
                            color: Colors.black,
                            shadows: shadowPPN3,
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    super.key,
    required this.width,
    required this.height,
    required this.titulo,
    required this.onChanged,
  });

  final double width;
  final double height;
  final String titulo;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: kTerciaryColor.withOpacity(0.8),
      border: Border.all(color: kSecondaryColor, width: 3),
    );
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.01,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.penToSquare,
                  size: 35,
                  // shadows: shadowPPN3,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  titulo,
                  style: GoogleFonts.anta(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          TextFormField(
            onChanged: onChanged,
            maxLines: 4,
            style: GoogleFonts.anta(
              fontSize: 15,
              color: Colors.black,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: GoogleFonts.anta(
                  fontSize: 20,
                  color: Colors.white,
                ),
                focusColor: Colors.white,
                isDense: true),
          )
        ],
      ),
    );
  }
}

class Custom1TextFormField extends StatelessWidget {
  const Custom1TextFormField({
    super.key,
    required this.placeholder,
    required this.icon,
    required this.color,
    required this.keyboardType,
    this.maxLines,
    required this.onChanged,
  });

  final String placeholder;
  final IconData icon;
  final Color color;
  final TextInputType keyboardType;
  final int? maxLines;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = InputDecoration(
        labelText: placeholder,
        labelStyle: GoogleFonts.anta(
          fontSize: 20,
          color: color,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: const Color(0xff424530),
        prefixIcon: Icon(
          icon,
          size: size.width * 0.065,
          // shadows: shadowPPN3,
        ),
        isDense: true);

    return TextFormField(
        maxLines: maxLines,
        cursorColor: kSecondaryColor,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: GoogleFonts.anta(
            fontSize: 20, color: color, fontWeight: FontWeight.bold),
        decoration: decoration);
  }
}
