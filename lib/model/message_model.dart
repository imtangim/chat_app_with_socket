import 'dart:convert';

class MessageModel {
  String message;
  String sentBy;
  DateTime timeStamp;
  MessageModel({
    required this.message,
    required this.sentBy,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'sentBy': sentBy,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] as String,
      sentBy: map['sentBy'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
