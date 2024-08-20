import 'package:flutter/material.dart';

class AddUserInterface extends StatefulWidget {
  const AddUserInterface({super.key});

  @override
  State<StatefulWidget> createState() => _AddUser();
}

class _AddUser extends State<AddUserInterface> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
              title: const Text('add THIS 🍆'),
              backgroundColor: Colors.blueAccent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: getTextFields()),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {},
                )
              ],
            ),
          )),
    );
  }
}

Column getTextFields() {
  return const Column(
    children: [
      TextField(
        decoration: InputDecoration(
            hintText: 'Id', hintStyle: TextStyle(color: Colors.grey)),
      ),
      TextField(
        decoration: InputDecoration(
            hintText: 'Name', hintStyle: TextStyle(color: Colors.grey)),
      ),
      TextField(
        decoration: InputDecoration(
            hintText: 'Age', hintStyle: TextStyle(color: Colors.grey)),
      ),
      TextField(
        decoration: InputDecoration(
            hintText: 'Address', hintStyle: TextStyle(color: Colors.grey)),
      ),
    ],
  );
}
