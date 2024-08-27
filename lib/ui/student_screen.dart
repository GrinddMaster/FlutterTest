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
                  decoration: const InputDecoration(hintText: 'id'),
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(hintText: 'name'),
                ),
                TextField(
                  controller: age,
                  decoration: const InputDecoration(hintText: 'age'),
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(hintText: 'address'),
                ),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(hintText: 'description'),
                ),
                TextField(
                  controller: location,
                  decoration: const InputDecoration(hintText: 'location'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: (widget.student.id.isEmpty)
                      ? const Text('Update')
                      : const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
