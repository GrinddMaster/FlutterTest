import 'package:flutter/material.dart';
import 'package:sqlonmob/interface/add_user_interface.dart';

SizedBox listIntrfc(BuildContext context) {
  return SizedBox(
      width: 700,
      height: 700,
      child: MaterialApp(
          home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("Employees 🚀"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Center(
          child: Text('No Employees 🦆', style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AddUserInterface()));
          },
          child: const Icon(Icons.person_add),
        ),
      )));
}
