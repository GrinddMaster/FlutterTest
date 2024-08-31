import 'package:firebaseimpl/model/student.dart';
import 'package:firebaseimpl/ui/student_listview.dart';
import 'package:flutter/material.dart';

TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController department = TextEditingController();

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
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const StudentListview()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                  controller: department,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(hintText: 'Department'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.student.id == null) {
                      studentRef.child(widget.student.id!).set({
                        'Name': name.text,
                        'Age': age.text,
                        'Address': address.text,
                        'Description': description.text,
                        'Department': department.text,
                      }).then((_) {
                        if (!context.mounted) return;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const StudentListview()));
                      });
                    } else {
                      studentRef.push().set({
                        //This just updates the existing student.
                        'Name': name.text,
                        'Age': age.text,
                        'Address': address.text,
                        'Description': description.text,
                        'Department': department.text,
                      }).then((_) {
                        if (!context.mounted) return;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const StudentListview()));
                      });
                    }
                  },
                  child: (widget.student.id != null)
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
