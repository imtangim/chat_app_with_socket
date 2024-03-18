import 'package:chat_app_with_socket/controller/chat_controller.dart';
import 'package:chat_app_with_socket/model/message_model.dart';
import 'package:chat_app_with_socket/resources/socket_client.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketMethod {
  final _socketClientSocket = SocketClient.instance.socket!;
  final ChatController _chatController = Get.put(ChatController());
  void sendMessage(String name) {
    Map<String, dynamic> message = {
      "message": name,
      "sentBy": _socketClientSocket.id,
      "timeStamp": DateTime.now().millisecondsSinceEpoch,
    };

    if (name.isNotEmpty) {
      _socketClientSocket.emit("message", message);
      _chatController.chatMessages.add(MessageModel.fromMap(message));
    }
  }

  void newMessageListener() {
    _socketClientSocket.on("new-message", (data) {
      _chatController.chatMessages.add(MessageModel.fromMap(data));
      _chatController.updateList();
    });
  }

  void connectedUserListener() {
    _socketClientSocket.on(
        "connected-user", (data) => _chatController.connectedUser.value = data);
  }

  Socket get socketClientintance => _socketClientSocket;
}
