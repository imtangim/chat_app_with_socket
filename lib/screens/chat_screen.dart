import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import 'package:chat_app_with_socket/controller/chat_controller.dart';
import 'package:chat_app_with_socket/model/message_model.dart';
import 'package:chat_app_with_socket/resources/socket_method.dart';
import 'package:chat_app_with_socket/utils/color.dart';
import 'package:chat_app_with_socket/widget/custom_textfield.dart';
import 'package:chat_app_with_socket/widget/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgController = TextEditingController();
  final SocketMethod socketMethod = SocketMethod();
  final ChatController _chatController = Get.put(ChatController());

  String convertEpochToAMPM(DateTime epochSeconds) {
    // Format the DateTime object to AM/PM time format
    String formattedTime = DateFormat.jm().format(epochSeconds);
    return formattedTime;
  }

  @override
  void initState() {
    socketMethod.newMessageListener();
    socketMethod.connectedUserListener();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Connected user ${_chatController.connectedUser.value}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Obx(
                () => ListView.builder(
                  itemCount: _chatController.chatMessages.length,
                  itemBuilder: (context, index) {
                    MessageModel message = _chatController.chatMessages[index];
                    log(_chatController.chatMessages.length.toString());
                    return MessageItem(
                      fromMe:
                          message.sentBy == socketMethod.socketClientintance.id
                              ? true
                              : false,
                      text: message.message,
                      timeStamp: convertEpochToAMPM(message.timeStamp),
                    );
                  },
                ),
              ),
            ),
            CustomTextField(
              msgController: msgController,
              ontap: () {
                sendMessage(msgController.text);

                msgController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String message) {
    socketMethod.sendMessage(msgController.text);
    // socketMethod.disconnectSocket();
    // socketMethod.connectSocket();
  }
}
