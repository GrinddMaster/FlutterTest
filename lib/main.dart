import 'package:flutter/material.dart';
import 'package:sqlonmob/utils/dbmaker.dart';
import 'package:sqlonmob/utils/users.dart';

String output = '';

DatabaseHandler dBh = DatabaseHandler();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dBh.insertUser(
      const User(id: 20, name: "Jhonny", age: 21, address: "a7a street"));
  dBh.insertUser(
      const User(id: 30, name: "Timmy", age: 22, address: "street 0"));

  List<User> users = await dBh.listForUsers();
  output = await dBh.showDbContents();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SqliteImp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(output),
          ],
        ),
      ),
    );
  }
}
