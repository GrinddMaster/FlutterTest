import 'package:firebase_database/firebase_database.dart';

class Student {
  String id = '';
  String name = '';
  int age = 0;
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
    id = (snap.value as Map<String, dynamic>)['Id'];
    name = (snap.value as Map<String, dynamic>)['Name'];
    age = (snap.value as Map<String, dynamic>)['Age'];
    address = (snap.value as Map<String, dynamic>)['Address'];
    description = (snap.value as Map<String, dynamic>)['Description'];
    department = (snap.value as Map<String, dynamic>)['Department'];
  }
}
