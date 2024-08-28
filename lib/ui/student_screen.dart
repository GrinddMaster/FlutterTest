import 'package:firebaseimpl/model/student.dart';
import 'package:firebaseimpl/ui/student_listview.dart';
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
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Id'),
                ),
                TextField(
                  controller: name,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: age,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Age'),
                ),
                TextField(
                  controller: address,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Address'),
                ),
                TextField(
                  controller: description,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: location,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Location'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.student.id.isEmpty) {
                      studentRef.child(widget.student.id).set({
                        'Id': id,
                        'Name': name,
                        'Age': age,
                        'Address': address,
                        'Description': description,
                        'Department': department,
                        'Location': location
                      }).then((_) {
                        //Makes sure that the widget that gave the context is still in the widget tree and I am poping the correct context.
                        //Otherwise I would be poping with a context that doesn't exist. Which would cause errors and unexpected behaviour.
                        if (!context.mounted) return;
                        Navigator.pop(context);
                      });
                    } else {
                      studentRef.push().set({
                        //This just updates the existing student.
                        'Id': id,
                        'Name': name,
                        'Age': age,
                        'Address': address,
                        'Description': description,
                        'Department': department,
                        'Location': location
                      }).then((_) {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: (widget.student.id.isNotEmpty)
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
