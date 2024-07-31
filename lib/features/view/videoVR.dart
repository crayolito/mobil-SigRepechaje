import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';
import 'package:video_360/video_360.dart';

class Video360ViewPersonalized extends StatefulWidget {
  const Video360ViewPersonalized({super.key});

  @override
  State<Video360ViewPersonalized> createState() =>
      _Video360ViewPersonalizedState();
}

class _Video360ViewPersonalizedState extends State<Video360ViewPersonalized> {
  Video360Controller? controller;
  // final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? aux;
  int teniaNet = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // aux =
    //     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     teniaNet--;
    //     controller?.stop();
    //     if (teniaNet == -1) {
    //       Navigator.pop(context);
    //     }
    //   } else {
    //     teniaNet = 1;
    //     controller?.play();
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    aux?.cancel();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: const ButtonCloseScreen(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Video360View(
          onPlayInfo: (val) {
            print('2 ${val.duration}');
            // -9223372036854775807
            // if (val.total == -9223372036854775807) {
            // showLoadingMessage(context);
            // }
            // -9223372036854775807
          },
          useAndroidViewSurface: true,
          onVideo360ViewCreated: _onVideo360ViewCreated,
          url:
              "https://dl.dropboxusercontent.com/scl/fi/v7yl11rwfx39hdbtagnva/Moto-GP-360-Circuito-Urbano.mp4?rlkey=0h46nikfqehevx07shtpl7wmo&dl=0?d1=0",
          isRepeat: true,
        ),
      ),
    );
  }

  _onVideo360ViewCreated(Video360Controller? controller) {
    if (controller != null) {
      this.controller = controller;
      this.controller!.play();
    }
  }
}
