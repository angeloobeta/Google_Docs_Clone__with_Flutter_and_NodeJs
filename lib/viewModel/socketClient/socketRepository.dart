import 'package:google_docs_clone/model/service/client/socketClient.dart';
import 'package:socket_io_client/src/socket.dart';

class SocketRepository {
  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;

  void joinRoom(String documentId) {
    _socketClient.emit("join", documentId);
  }

  void typing(Map<String, dynamic> data) {
    _socketClient.emit("typing", data);
  }

  void onChangeListener(Function(Map<String, dynamic>) function) {
    _socketClient.on("changes", (data) => function(data));
  }
}
