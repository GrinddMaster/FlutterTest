import 'package:firebaseimpl/Views/sign_up.dart';
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
    return Scaffold(
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
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Get in!"),
            ),
          ],
        ),
      ),
    );
  }
}
