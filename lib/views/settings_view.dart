import 'package:flutter/material.dart';
import 'package:testproj/color_decoration.dart';
import 'grid_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text("Welcome settings"),
                backgroundColor: appColors[20],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: appColors[50],
                  ),
                  tabs: const [
                    Tab(
                      text: "test1",
                    ),
                    Tab(
                      text: "test2",
                    ),
                    Tab(
                      text: "test3",
                    ),
                  ],
                )),
            body: TabBarView(
              children: [
                gridItems(),
                const Icon(Icons.car_crash),
                const Icon(Icons.airplane_ticket),
              ],
            ),
          ),
        ));
  }
}
