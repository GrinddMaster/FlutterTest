import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseimpl/model/student.dart';

class StudentListview extends StatefulWidget {
  const StudentListview({super.key});
  @override
  State<StatefulWidget> createState() => _StudentList();
}

final studenRef = FirebaseDatabase.instance.ref().child('student');

class _StudentList extends State<StudentListview> {
//TODO: get the list of students from the firebase database
//TODO: Do crud with firebase. 


late List<Student> items;
StreamSubscription onStudentAdded;
StreamSubscription onStudentChanged;
StreamSubscription onStudentRemoved;


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
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
