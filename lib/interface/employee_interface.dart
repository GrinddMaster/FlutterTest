import 'package:flutter/material.dart';
import 'package:sqlonmob/utils/dbmaker.dart';
import 'package:sqlonmob/utils/users.dart';

DatabaseHandler dBh = DatabaseHandler();

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<StatefulWidget> createState() => _EmployeeInterface();
}

class _EmployeeInterface extends State<Employees> {
  late Future<List<User>> _empList;

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
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('🖕( ͡❛ ͜ʖ ͡❛)');
        } else {
          return SizedBox(
            width: 700,
            height: 700,
            child: MaterialApp(
              home: Scaffold(
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
                      final users = snapshot.data![index];
                      return Container(
                        color: index % 2 == 0
                            ? Colors.grey
                            : Colors.brown, // Alternating colors
                        child: ListTile(
                          iconColor: Colors.white,
                          dense: true,
                          textColor: Colors.black87,
                          title: Text(
                            users.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'Name:${users.name}\tAge:${users.age}\nid:${users.id}\taddress:${users.address}'),
                          leading: const Icon(Icons.person_rounded),
                        ),
                      );
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          );
        } //end of else
      },
    );
  }
}
