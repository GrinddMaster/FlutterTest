import 'package:firebase_database/firebase_database.dart';

class User {
  String? id = "";
  String username = '';
  String password = '';
  int phone = 0;
  List<int> userChats = [];//This should hold the id to the user's chatrooms.

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> usrMap() {
    return {
      'Id': id,
      'UserName': username,
      'Password': password,
      'Phone': phone,
    };
  }

  User.fromSnapshot(DataSnapshot snap) {
    id = snap.key;
    username = snap.child('UserName').value as String;
    password = snap.child('Password').value as String;
    phone = snap.child('Phone').value as int;
  }
}
