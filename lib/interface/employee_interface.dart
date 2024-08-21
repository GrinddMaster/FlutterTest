import 'package:flutter/material.dart';
import 'package:sqlonmob/interface/add_user_interface.dart';
import 'package:sqlonmob/utils/dbmaker.dart';
import 'package:sqlonmob/utils/users.dart';
import 'package:sqlonmob/interface/list_interface.dart';

DatabaseHandler dBh = DatabaseHandler();

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<StatefulWidget> createState() => EmployeeInterface();
}

class EmployeeInterface extends State<Employees> {
  late Future<List<User>> _empList;

  void updater() {
    setState(() {
      _empList = _fetchEmps();
    });
  }

  @override
  void initState() {
    super.initState();
    _empList = _fetchEmps(); // Initialize the Future when the widget is created
  }

  Future<List<User>> _fetchEmps() async {
    return dBh.listForUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _empList,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error loading Employees: ${snapshot.error}');
        } else {
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
                body: SizedBox(
                  width: 700,
                  height: 700,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      User users = snapshot.data![index];
                      return Container(
                        color: index % 2 == 0
                            ? Colors.grey
                            : Colors.brown, // Alternating colors
                        child: ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outlined,
                                color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                dBh.removeUser(users.id);
                                _empList = _fetchEmps();
                              });
                            },
                          ),
                          iconColor: Colors.white,
                          dense: true,
                          textColor: Colors.black87,
                          title: Text(
                            users.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'Name:${users.name}\tAge:${users.age}\nid:${users.id}\taddress:${users.address}'),
                          leading: const Icon(
                            Icons.person_rounded,
                            color: Colors.white70,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddUserInterface()));
                  },
                  child: const Icon(Icons.person_add),
                ),
              ),
            ),
          );
        } //end of else
      },
    );
  }
}
