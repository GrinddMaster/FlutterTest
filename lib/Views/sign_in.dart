import 'package:flutter/material.dart';

//Flags
bool? checkbox = false;
//--------------

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() => SignPage();
}

class SignPage extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sign In 👤"),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Welcome!"),
              const TextField(
                decoration: InputDecoration(
                  hintText: "UserName",
                ),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              Row(
                children: [
                  const Text("Remember me: "),
                  Checkbox(
                    value: checkbox,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox = value;
                      });
                    },
                  ),
                ],
              ),
              const Text("Sign up."),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Get in!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
