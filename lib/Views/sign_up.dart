import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Sign Up"),
            ),
            body: const Center(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "UserName"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Confirm Password"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Phone Number"),
                  ),
                ],
              ),
            )));
  }
}
