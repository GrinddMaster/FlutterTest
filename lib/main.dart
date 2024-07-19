import 'package:flutter/material.dart';
import 'custom_list.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text('Unit Converter',style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.white,
        ),),
      ),
      body: const CustomList(),
    ),
  ));
}