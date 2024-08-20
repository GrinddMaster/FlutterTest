import 'package:flutter/material.dart';
import 'package:sqlonmob/utils/dbmaker.dart';
import 'package:sqlonmob/interface/employee_interface.dart';

String output = '';

DatabaseHandler dBh = DatabaseHandler();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(" 🍑 Sqlite"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('View Employees'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Employees()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
