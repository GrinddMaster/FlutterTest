import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPage();
}

class SignUpPage extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: Center(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(hintText: "UserName"),
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Password"),
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Confirm Password"),
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Phone Number"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Confirm"),
              )
            ],
          ),
        ));
  }
}
