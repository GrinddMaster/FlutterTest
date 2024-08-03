import 'package:flutter/material.dart';
import 'package:testproj/color_decoration.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Welcome support"),
            backgroundColor: appColors[20],
          ),
        ));
  }
}
