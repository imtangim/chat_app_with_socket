import 'package:chat_app_with_socket/utils/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController msgController;
  final VoidCallback ontap;
  const CustomTextField(
      {super.key, required this.msgController, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 2),
      // color: Colors.red,
      child: TextField(
        cursorColor: purple,
        style: const TextStyle(color: Colors.white),
        controller: msgController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: purple,
            ),
            child: IconButton(
              onPressed: ontap,
              icon: const Icon(
                color: Colors.white,
                Icons.send,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
