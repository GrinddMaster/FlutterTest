import 'dart:convert';
import 'package:flutter/material.dart';
import 'GUI/homeui.dart';

void main() async {
  Home home = const Home();
  data = await home.getData();
  post = jsonDecode(data);
  runApp(const MyApp());
}

void colorSwitcher(bool value) {
  if (value == true) {
    testColor = Colors.amber;
    colorFlag = false;
  } else {
    testColor = Colors.green;
    colorFlag = true;
  }
}

bool colorFlag = true;//Used to switch the color of the testbody
String data = "";
List post = [];
Color testColor = Colors.green;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ApiTest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void test() {
      setState(() {
        colorSwitcher(colorFlag);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "This a test",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ColoredBox(
        color: Colors.black54,
        child: Center(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              final newPosition = index / 2;
              return ListTile(
                title: Text(
                  post[index]['title'],
                  style: const TextStyle(
                    color: Colors.white54,
                  ),
                ),
                subtitle: Text(
                  post[newPosition.toInt()]['body'],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: testColor),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.pink,
                  child: Text('P${index.toString()}'),
                ),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 1),
                ),
                onTap: test,
              );
            },
          ),
        ),
      ),
    );
  }
}
