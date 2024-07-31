import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/turismo/turismo_bloc.dart';
import 'package:distrito7_mobile/config/constants/paleta-colores.dart';
import 'package:distrito7_mobile/config/constants/shadow.constant.dart';
import 'package:distrito7_mobile/data/puntosInteres.data.dart';
import 'package:distrito7_mobile/features/search/search/widgetsSIG/itemSearchBar.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreenSIG extends StatelessWidget {
  const SearchScreenSIG({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    // NOTE: Navbar de la pantalla de busqueda
                    const NavbarCustom(),
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        padding: EdgeInsets.only(
                            left: size.width * 0.015,
                            right: size.width * 0.015,
                            bottom: size.height * 0.005),
                        height: size.height * 0.83,
                        width: size.width,
                        child: ListView.builder(
                            itemCount:
                                turismoBloc.state.puntosInteresCliente.length,
                            itemBuilder: (context, index) {
                              return ItemPuntoCorte(
                                  puntoInteres: turismoBloc
                                      .state.puntosInteresCliente[index],
                                  index: index);
                            })),
                  ],
                ),
              ),
              //  NOTE: Filtrado de los items de la lista de puntos de corte
              const SearchBarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarCustom extends StatefulWidget {
  const NavbarCustom({
    super.key,
  });

  @override
  State<NavbarCustom> createState() => _NavbarCustomState();
}

class _NavbarCustomState extends State<NavbarCustom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
      ),
      width: size.width,
      height: size.height * 0.16,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kSecondaryColor,
              size: size.width * 0.08,
              shadows: shadowKCC,
            ),
            onPressed: () {
              // context.pop();
              Navigator.pop(context);
            },
          ),
          Text(
            "PUNTOS INTERES",
            style: estilosText!.titulo4,
          ),
          IconButton(
              onPressed: () {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.469,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.01,
                        ),
                        width: size.width,
                        height: size.height * 0.5,
                        color: Colors.white,
                        child: const Material(
                          child: Column(
                            children: [
                              // READ : TITULO DEL WIDGETS
                              TitleFiltro(),
                              // READ : FILTRO DE TRANSPORTE
                              FiltroTransporte(),
                              // READ : FILTRO DE TRAFICO
                              FiltroTrafico(),
                              // READ : ESCOGER LA RUTA DE CORTE
                              FiltroRutaCorte(),
                              // READ : ON OFF DE RUTAS ALTERNATIVAS
                              FiltroRutaAlternativa(),
                              // READ : BOTONES DE FILTRADO DE RUTA DE CORTE
                              ButtonsFiltroRutaCorte()
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                FontAwesomeIcons.sliders,
                color: kSecondaryColor,
                size: size.width * 0.08,
                shadows: shadowKCC,
              ))
        ],
      ),
    );
  }
}

class ButtonsFiltroRutaCorte extends StatelessWidget {
  const ButtonsFiltroRutaCorte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return SizedBox(
      height: size.height * 0.07,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              // mapBloc.add(const OnInsertContentMap());
              turismoBloc.add(const OnResetViewClienteDPC());
              mapBloc.add(const OnInsertContentMap());
            },
            child: Text("Reset", style: estilosText!.subTitulo2FiltroRuta),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              // context.pop();
              // ShowLoadingCustom.showLoadingProcesoRutas(context);
            },
            child: Text("Aplicar", style: estilosText!.subTitulo2FiltroRuta),
          )
        ],
      ),
    );
  }
}

class FiltroRutaAlternativa extends StatelessWidget {
  const FiltroRutaAlternativa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);

    return Container(
        height: size.height * 0.07,
        width: size.width,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text("Rutas Alternativas", style: estilosText!.titulo2FiltroRuta),
            Checkbox(
              activeColor: kPrimaryColor,
              value: turismoBloc.state.showAlternativa,
              onChanged: (value) {
                turismoBloc.add(OnChangedFiltroRutaCorte(
                    showAlternativa: !turismoBloc.state.showAlternativa));
              },
            ),
          ],
        ));
  }
}

class FiltroRutaCorte extends StatefulWidget {
  const FiltroRutaCorte({
    super.key,
  });

  @override
  State<FiltroRutaCorte> createState() => _FiltroRutaCorteState();
}

class _FiltroRutaCorteState extends State<FiltroRutaCorte> {
  late int tipoRuta;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);
    tipoRuta = turismoBloc.state.tipoRuta;
    controller.value = TextEditingValue(
      text: tipoRuta.toString(),
    );

    final decoration = InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kCColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: kPrimaryColor,
        isDense: true);

    return SizedBox(
      height: size.height * 0.067,
      width: size.width,
      child: Row(
        children: [
          Text("Escoger Ruta : ", style: estilosText!.titulo2FiltroRuta),
          SizedBox(
            width: size.width * 0.02,
          ),
          SizedBox(
              width: size.width * 0.18,
              child: TextFormField(
                readOnly: true,
                controller: controller,
                cursorColor: kSecondaryColor,
                style: estilosText!.letraInput,
                textAlign: TextAlign.center,
                decoration: decoration,
              )),
          SizedBox(
            width: size.width * 0.03,
          ),
          IconButton(
              onPressed: () {
                if (tipoRuta <= 1) return;
                setState(() {
                  tipoRuta--;
                  controller.value = TextEditingValue(
                    text: tipoRuta.toString(),
                  );
                });
                turismoBloc.add(OnChangedFiltroRutaCorte(tipoRuta: tipoRuta));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
                size: size.width * 0.08,
              )),
          IconButton(
              onPressed: () {
                if (tipoRuta >= 9) return;
                setState(() {
                  tipoRuta++;
                  controller.value = TextEditingValue(
                    text: tipoRuta.toString(),
                  );
                });
                turismoBloc.add(OnChangedFiltroRutaCorte(tipoRuta: tipoRuta));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
                size: size.width * 0.08,
              ))
        ],
      ),
    );
  }
}

class FiltroTrafico extends StatelessWidget {
  const FiltroTrafico({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      height: size.height * 0.1,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Preferencia de Trafico",
                style: estilosText!.titulo2FiltroRuta),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    turismoBloc.add(const OnChangedFiltroRutaCorte(
                        nivelTrafico: NivelTrafico.con));
                  },
                  child: Text("CON",
                      style: turismoBloc.state.tipoTrafico == NivelTrafico.con
                          ? estilosText!.subTituloFiltroRutaSeleccionado
                          : estilosText!.subTituloFiltroRuta)),
              GestureDetector(
                  onTap: () {
                    turismoBloc.add(const OnChangedFiltroRutaCorte(
                        nivelTrafico: NivelTrafico.sin));
                  },
                  child: Text("SIN",
                      style: turismoBloc.state.tipoTrafico == NivelTrafico.sin
                          ? estilosText!.subTituloFiltroRutaSeleccionado
                          : estilosText!.subTituloFiltroRuta)),
              GestureDetector(
                  onTap: () {
                    turismoBloc.add(const OnChangedFiltroRutaCorte(
                        nivelTrafico: NivelTrafico.optimo));
                  },
                  child: Text("OPTIMO",
                      style:
                          turismoBloc.state.tipoTrafico == NivelTrafico.optimo
                              ? estilosText!.subTituloFiltroRutaSeleccionado
                              : estilosText!.subTituloFiltroRuta)),
            ],
          )
        ],
      ),
    );
  }
}

class FiltroTransporte extends StatelessWidget {
  const FiltroTransporte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);

    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Medio de Transporte",
                style: estilosText!.titulo2FiltroRuta),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  turismoBloc.add(const OnChangedFiltroRutaCorte(
                      tipoTransporte: TipoTransporte.caminar));
                },
                icon: Icon(
                  FontAwesomeIcons.walking,
                  size: size.width * 0.08,
                  color:
                      turismoBloc.state.tipoTransporte == TipoTransporte.caminar
                          ? kPrimaryColor
                          : kSecondaryColor,
                  shadows:
                      turismoBloc.state.tipoTransporte == TipoTransporte.caminar
                          ? shadowKSN2
                          : null,
                ),
              ),
              IconButton(
                onPressed: () {
                  turismoBloc.add(const OnChangedFiltroRutaCorte(
                      tipoTransporte: TipoTransporte.bicicleta));
                },
                icon: Icon(
                  FontAwesomeIcons.bicycle,
                  size: size.width * 0.08,
                  color: turismoBloc.state.tipoTransporte ==
                          TipoTransporte.bicicleta
                      ? kPrimaryColor
                      : kSecondaryColor,
                  shadows: turismoBloc.state.tipoTransporte ==
                          TipoTransporte.bicicleta
                      ? shadowKSN2
                      : null,
                ),
              ),
              IconButton(
                onPressed: () {
                  turismoBloc.add(const OnChangedFiltroRutaCorte(
                      tipoTransporte: TipoTransporte.carro));
                },
                icon: Icon(
                  FontAwesomeIcons.car,
                  size: size.width * 0.08,
                  color:
                      turismoBloc.state.tipoTransporte == TipoTransporte.carro
                          ? kPrimaryColor
                          : kSecondaryColor,
                  shadows:
                      turismoBloc.state.tipoTransporte == TipoTransporte.carro
                          ? shadowKSN2
                          : null,
                ),
              ),
              IconButton(
                  onPressed: () {
                    turismoBloc.add(const OnChangedFiltroRutaCorte(
                        tipoTransporte: TipoTransporte.moto));
                  },
                  icon: Icon(
                    FontAwesomeIcons.motorcycle,
                    size: size.width * 0.08,
                    color:
                        turismoBloc.state.tipoTransporte == TipoTransporte.moto
                            ? kPrimaryColor
                            : kSecondaryColor,
                    shadows:
                        turismoBloc.state.tipoTransporte == TipoTransporte.moto
                            ? shadowKSN2
                            : null,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class TitleFiltro extends StatelessWidget {
  const TitleFiltro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: size.height * 0.05,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Opciones de filtrado",
            style: estilosText!.tituloTipoMapa,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: kPrimaryColor,
                size: size.width * 0.08,
              ))
        ],
      ),
    );
  }
}

class ItemPuntoCorte extends StatelessWidget {
  const ItemPuntoCorte({
    super.key,
    required this.puntoInteres,
    required this.index,
  });

  final int index;
  final PuntosInteres puntoInteres;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    final turismoBloc = BlocProvider.of<TurismoBloc>(context, listen: true);
    return FadeInLeft(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
        ),
        height: size.height * 0.11,
        width: size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kPrimaryColor.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  mapBloc.add(OnRoutesXaY(
                      LatLng(puntoInteres.latitud, puntoInteres.longitud),
                      puntoInteres));
                  Navigator.pop(context);
                  // context.pop();
                },
                child: Icon(
                  FontAwesomeIcons.route,
                  size: size.width * 0.08,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.73,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    puntoInteres.nombre,
                    textAlign: TextAlign.start,
                    style: estilosText!.tituloItemPC,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    puntoInteres.uv,
                    textAlign: TextAlign.start,
                    style: estilosText!.subTituloItemPC,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    turismoBloc.add(OnChangedRouteSelect(
                        index: index, puntoInteres: puntoInteres));
                  },
                  child: Icon(
                    puntoInteres.select
                        ? FontAwesomeIcons.checkCircle
                        : FontAwesomeIcons.circle,
                    size: size.width * 0.08,
                    color: puntoInteres.select
                        ? kPrimaryColor
                        : kPrimaryColor.withOpacity(0.5),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
