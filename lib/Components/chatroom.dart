import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseimpl/Components/user.dart';

class Chatroom {
  List<String> chatData = [];
  List<User> roomMembers = [];
  String roomName = '';
  String? roomId = '';

  Chatroom({
    required this.chatData,
    required this.roomMembers,
    required this.roomName,
    required this.roomId,
  });

  Map<String, dynamic> chatList() {
    return {
      'Chat_Data': chatData,
      'Room_Members': roomMembers,
      'Room_Name': roomName,
      'Room_Id': roomId,
    };
  }

  Chatroom.fromSnapshot(DataSnapshot snap) {
    roomId = snap.key;
    chatData = snap.child('Chat_Data').value as List<String>;
    roomMembers = snap.child('Room_Members').value as List<User>;
    roomName = snap.child('Room_Name').value as String;
  }
}
