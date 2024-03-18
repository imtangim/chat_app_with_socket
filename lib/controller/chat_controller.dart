import 'package:chat_app_with_socket/model/message_model.dart';
import 'package:get/get.dart';
class ChatController extends GetxController {
  RxList<dynamic> chatMessages = <MessageModel>[].obs;
  RxInt connectedUser=0.obs;

  void updateList() {
    chatMessages.refresh();
    update();
  }
}
