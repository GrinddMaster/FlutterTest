import 'package:flutter/material.dart';
import 'package:sqlonmob/utils/dbmaker.dart'; // Import your necessary dependencies
import 'package:sqlonmob/utils/users.dart';

DatabaseHandler handler = DatabaseHandler();

class UserInterface extends StatefulWidget {
  const UserInterface({super.key});

  @override
  _MyUsersState createState() => _MyUsersState();
}

class _MyUsersState extends State<UserInterface> {
  late Future<List<User>> _userList;

  @override
  void initState() {
    super.initState();
    _userList =
        _fetchUsers(); // Initialize the Future when the widget is created
  }

  Future<List<User>> _fetchUsers() async {
    return handler.listForUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 370,
      child: FutureBuilder<List<User>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error loading users: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No users found.');
          } else {
            // Display the list of users
            return ColoredBox(
              color: Colors.white,
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(
                        'Id:${user.id}\tAge:${user.age}\nAddress:${user.address}'),
                    leading: Container(
						decoration: const BoxDecoration(shape:BoxShape.circle,color: Colors.black),
                        child: const Icon(
                          Icons.person_2_rounded,
						  size: 40,
                          color: Colors.grey,
                        )),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
