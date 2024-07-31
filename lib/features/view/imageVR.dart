import 'package:distrito7_mobile/helper/show_loading_message.dart';
import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class Image360View extends StatefulWidget {
  const Image360View({
    super.key,
  });

  @override
  State<Image360View> createState() => _Image360ViewState();
}

class _Image360ViewState extends State<Image360View> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoadingMap(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
        floatingActionButton: const ButtonCloseScreen(),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: PanoramaViewer(
              onImageLoad: () {
                Navigator.pop(context);
              },
              sensorControl: SensorControl.orientation,
              animSpeed: 1,
              child: Image.network(
                args!['url'],
                fit: BoxFit.cover,
              )),
        ));
  }
}
