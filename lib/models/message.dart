import 'package:scholar__app/constans.dart';

class Message {
  final String message;

  Message(this.message);
  // Message(this.message);

  factory Message.fromjson(jsondata) {
    return Message(jsondata[kmessage]);
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
