import 'package:firebase_database/firebase_database.dart';

class Student {
  String? id = '';
  String name = '';
  String age = '';
  String address = '';
  String description = '';
  String department = '';

  Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.address,
      required this.description,
      required this.department});
  Map<String, dynamic> stuMap() {
    return {
      'Id': id,
      'Name': name,
      'Age': age,
      'Address': address,
      'Description': description,
      'Department': department
    };
  }

  Student.fromSnapshot(DataSnapshot snap) {
    //It's important when getting the id making it a key that's given by the firebase.
    id = snap.key;
    name = snap.child('Name').value as String;
    age = snap.child('Age').value as String;
    address = snap.child('Address').value as String;
    description = snap.child('Description').value as String;
    department = snap.child('Department').value as String;
  }
}
