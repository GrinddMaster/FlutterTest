import 'dart:async';
import 'package:firebaseimpl/ui/student_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseimpl/model/student.dart';

class StudentListview extends StatefulWidget {
  const StudentListview({super.key});
  @override
  State<StatefulWidget> createState() => _StudentList();
}

final studentRef = FirebaseDatabase.instance.ref().child('flutter-implement');

class _StudentList extends State<StudentListview> {
//TODO: get the list of students from the firebase database
//TODO:implement CRUD with 🔥base

  late List<Student> items = [];
  late StreamSubscription onStudentSubAdded;
  late StreamSubscription onStudentSubUpdated;
  late StreamSubscription onStudentSubRemoved;

  @override
  void initState() {
    super.initState();
    onStudentSubAdded = studentRef.onChildAdded.listen(onStudentAdded);
    onStudentSubUpdated = studentRef.onChildAdded.listen(onStudentUpdated);
  }

  @override
  void dispose() {
    super.dispose();
    onStudentSubAdded.cancel();
    onStudentSubUpdated.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '🔥BaseTest',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Container(
            color: Colors.deepOrangeAccent,
            child: Column(
              children: [
                ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      title: Text('Test'),
                      leading: Icon(Icons.person),
                    );
                  },
                ),
                const Divider(
                  height: 3,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: IconButton(
          color: Colors.blue,
          onPressed: () {
            createToStudent(context);
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  void onStudentAdded(DatabaseEvent event) {
    setState(() {
      items.add(Student.fromSnapshot(event.snapshot));
    });
  }

  void onStudentUpdated(DatabaseEvent event) {
    var oldStudent =
        items.singleWhere((student) => student.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldStudent)] = Student.fromSnapshot(event.snapshot);
    });
  }

  void onStudentRemoved(
      BuildContext context, Student student, int index) async {
    await studentRef.child(student.id).remove().then((_) {
      setState(() {
        items.removeAt(index);
      });
    });
  }

  void createToStudent(BuildContext context) async {
    //TODO: fetch the student info from the database and show it on the student screen.
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => StudentScreen(Student(
                //this is a place holder student that is sent so I can add an actual student to the database.
                id: '',
                name: '',
                age: 0,
                address: '',
                description: '',
                department: ''))));
  }
}
