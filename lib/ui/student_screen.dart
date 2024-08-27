import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  final int id;
  const StudentScreen(this.id, {super.key});

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
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
