import 'dart:convert';
import 'package:flutter/material.dart';
import 'GUI/homeui.dart';

List post = [];
String data = "";

void main() async {
  Home home = const Home();
  data = await home.getData();
  post = jsonDecode(data);
  runApp(const MyApp());
}

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("This a test",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
			  final newPosition = index/2;
            return ListTile(
              title: Text(post[index]['title']),
              subtitle: Text(
                post[newPosition.toInt()]['body'],
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                foregroundColor: Colors.pink,
                child: Text('P${index.toString()}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
