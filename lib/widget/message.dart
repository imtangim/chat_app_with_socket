import 'package:chat_app_with_socket/utils/color.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.fromMe, required this.text, required this.timeStamp});
  final bool fromMe;
  final String text;
  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: fromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: fromMe ? purple : white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: !fromMe ? black : white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              timeStamp,
              style: TextStyle(
                fontSize: 11,
                color: (!fromMe ? black : white).withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
