import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectionStatus {
  online,
  offline,
}

class CheckInternetConnection {
  final Connectivity _connectivity = Connectivity();

  /// We assume the initial status is Online
  final _controller = BehaviorSubject.seeded(ConnectionStatus.online);
  StreamSubscription? _connectionSubscription;

  CheckInternetConnection() {
    _checkInternetConnection();
  }

  Stream<ConnectionStatus> internetStatus() {
    _connectionSubscription ??= _connectivity.onConnectivityChanged
        .listen((_) => _checkInternetConnection());
    return _controller.stream;
  }

  Future<void> _checkInternetConnection() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _controller.sink.add(ConnectionStatus.online);
      } else {
        _controller.sink.add(ConnectionStatus.offline);
      }
    } on SocketException catch (_) {
      print('No se pudo resolver el nombre de host');
      _controller.sink.add(ConnectionStatus.offline);
    } catch (e) {
      print('Ocurrió un error desconocido: $e');
      _controller.sink.add(ConnectionStatus.offline);
    }
  }

  Future<void> close() async {
    await _connectionSubscription?.cancel();
    await _controller.close();
  }
}
