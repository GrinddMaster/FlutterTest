import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

  Future<String> getData() async {
    String testUrl = 'https://jsonplaceholder.typicode.com/posts';
    Uri uri = Uri.parse(testUrl); // Convert the string to a Uri
    http.Response response = await http.get(uri);
    return response.body;
  }
}

class HomeState extends State<Home> {
  String displayIn = "";
  List posts = [];
  String outPutText = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TestAPI"),
          backgroundColor: Colors.indigo,
        ),
        body: const Center(
          child: Column(),
        ),
      ),
    );
  }
}
