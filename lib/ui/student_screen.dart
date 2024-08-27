import 'package:firebaseimpl/model/student.dart';
import 'package:flutter/material.dart';

TextEditingController id = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController department = TextEditingController();
TextEditingController location = TextEditingController();

class StudentScreen extends StatefulWidget {
  final Student student;
  const StudentScreen(this.student, {super.key});
  @override
  State<StatefulWidget> createState() => _StuScrn();
}

class _StuScrn extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student_Screen 🤯'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: id,
                ),
                TextField(
                  controller: name,
                ),
                TextField(
                  controller: age,
                ),
                TextField(
                  controller: address,
                ),
                TextField(
                  controller: description,
                ),
                TextField(
                  controller: location,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
