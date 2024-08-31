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

final studentRef = FirebaseDatabase.instance.ref().child('student');

class _StudentList extends State<StudentListview> {
  late List<Student> items = [];
  late StreamSubscription onStudentSubAdded;
  late StreamSubscription onStudentSubUpdated;
  late StreamSubscription onStudentSubRemoved;

  @override
  void initState() {
    super.initState();
    //When there's a change in the firebase. The onStudentAdded is called automatically.
    onStudentSubAdded = studentRef.onChildAdded.listen(onStudentAdded);
    onStudentSubUpdated = studentRef.onChildChanged.listen(onStudentUpdated);
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
        body: SizedBox(
          height: 700,
          width: 500,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blue,
                child: ListTile(
                  title: Text('Name: ${items[index].name}'),
                  subtitle: Text(items[index].description),
                  leading: const Icon(Icons.person),
                ),
              );
            },
          ),
        ),
        floatingActionButton: IconButton(
          color: Colors.red,
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
    await studentRef.child(student.id!).remove().then((_) {
      setState(() {
        items.removeAt(index);
      });
    });
  }

  void createToStudent(BuildContext context) async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => StudentScreen(Student(
                //this is a place holder student that is sent so I can add an actual student to the database.
                id: '',
                name: '',
                age: '',
                address: '',
                description: '',
                department: ''))));
  }
}
