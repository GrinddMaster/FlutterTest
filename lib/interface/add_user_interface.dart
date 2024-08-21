import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqlonmob/interface/employee_interface.dart';
import 'package:sqlonmob/utils/users.dart';

TextEditingController idcont = TextEditingController();
TextEditingController namecont = TextEditingController();
TextEditingController agecont = TextEditingController();
TextEditingController addresscont = TextEditingController();

String name = '';
String address = '';
int id = 0;
int age = 0;

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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Employees()));
                },
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: getTextFields()),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    id = int.parse(idcont.text.toString());
                    age = int.parse(agecont.text.toString());
                    name = namecont.text.toString();
                    address = addresscont.text.toString();
                    dBh.insertUser(
                        User(id: id, name: name, age: age, address: address));
                  },
                )
              ],
            ),
          )),
    );
  }
}

Column getTextFields() {
  return Column(
    children: [
      TextField(
        controller: idcont,
        decoration: const InputDecoration(
            hintText: 'Id', hintStyle: TextStyle(color: Colors.grey)),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
      TextField(
        controller: namecont,
        decoration: const InputDecoration(
            hintText: 'Name', hintStyle: TextStyle(color: Colors.grey)),
      ),
      TextField(
        controller: agecont,
        decoration: const InputDecoration(
            hintText: 'Age', hintStyle: const TextStyle(color: Colors.grey)),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
      TextField(
        controller: addresscont,
        decoration: const InputDecoration(
            hintText: 'Address', hintStyle: TextStyle(color: Colors.grey)),
      ),
    ],
  );
}
