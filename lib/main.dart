import 'package:flutter/material.dart';
import 'custom_list.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[20],
        foregroundColor: Colors.blue,
        title: const Text('Unit Converter',style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.blue,
        ),),
      ),
      body: const CustomList(),
    ),
  ));
}