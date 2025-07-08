import 'dart:async';

import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class ISocketService {
  void initialize();
  void dispose();
}

class SocketService implements ISocketService {
  late IO.Socket socket;
  int retryCount = 0;
  int maxRetries = 5;

  final StreamController<dynamic> _streamController =
      StreamController.broadcast();

  Stream<dynamic> get stream => _streamController.stream;

  @override
  void initialize() {
    try {
      socket = IO.io(
          AppConfigs.socketUrl,
          IO.OptionBuilder()
              .setTransports(['websocket'])
              .enableAutoConnect()
              .build());

      // socket.connect();
      socket.on('connection', (_) {
        customDebugPrint(message: 'I have connected>>');
      });

      socket.onConnect((_) {
        customDebugPrint(message: 'I have connected>>');
      });

      socket.on('', (data) {
        _streamController.add(data);
      });

      socket.onDisconnect((_) {
        _reconnect();
      });

      // socket.onDisconnect((_) {
      //   customDebugPrint(message: "connection Disconnection");
      //   customDebugPrint(message: "reconnecting now");
      //   socket.connect();
      // });
      socket.onConnectError((err) {
        customDebugPrint(message: 'connection err $err');
        Future.delayed(const Duration(seconds: 2), () => _reconnect());
        // initialize();
      });
      socket.onError((err) {
        customDebugPrint(message: err);
        // initialize();
      });
    } catch (err) {
      customDebugPrint(message: err.toString());
    }
  }

  void _reconnect() {
    if (retryCount < maxRetries) {
      retryCount++;
      Future.delayed(const Duration(seconds: 2), () {
        customDebugPrint(message: "Reconnecting attempt $retryCount");
        socket.connect();
      });
    } else {
      customDebugPrint(message: "Max retries reached");
    }
  }

  @override
  void dispose() {
    // Disconnect socket when no longer needed
    if (socket.connected) {
      _streamController.close();
      socket.dispose();
    }
  }
}
