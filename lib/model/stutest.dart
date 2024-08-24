import 'package:firebase_database/firebase_database.dart';

class Student {
  late int _id;
  late String _name;
  late int _age;
  late String _department;
  late String _description;

  Student(this._id, this._name, this._age, this._department, this._description);

  Student.map(obj) {
    _id = obj['id'];
    _name = obj['name'];
    _age = obj['age'];
    _department = obj['department'];
    _description = obj['description'];
  }

  int get id => _id;
  String get name => _name;
  int get age => _age;
  String get department => _department;
  String get description => _description;

  Student.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.value?['id'];
    _name = snapshot.value['name'];
    _age = snapshot.value['age'];
    _department = snapshot.value['department'];
    _description = snapshot.value['description'];
  }
}
