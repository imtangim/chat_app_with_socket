import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketClient {
  io.Socket? socket;
  static SocketClient? _instance;

  SocketClient.initializeSocket() {
    socket = io.io(
      "http://192.168.31.78:4000",
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );
    socket?.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient.initializeSocket();
    return _instance!;
  }
}
