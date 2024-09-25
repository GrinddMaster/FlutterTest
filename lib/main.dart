import 'package:firebaseimpl/Views/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignIn(),
    );
  }
}
//TODO: Build the objects and the clases for the users and chatroom
//TODO: Build the view for the user that's signed in.
//TODO: Keep the info about the user that's signed in.
