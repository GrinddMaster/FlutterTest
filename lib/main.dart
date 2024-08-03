import 'package:flutter/material.dart';
import 'color_decoration.dart';
import 'drawer_items.dart';

int _itemIndex = 0;
List<Widget> _page = [
  const Text(
    "Welcome Home",
    style: TextStyle(fontSize: 20),
  ),
  const Text(
    "Phone Call",
    style: TextStyle(fontSize: 20),
  ),
  const Text(
    "Pizza",
    style: TextStyle(fontSize: 20),
  )
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  void _onTapped(int index) {
    setState(() {
      _itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: drawerItems(context),
        ),
        appBar: AppBar(
          title: const Text("BottomNav Test"),
          backgroundColor: appColors[40],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: appColors[70],
          selectedIconTheme: IconThemeData(color: appColors[30], size: 30),
          selectedFontSize: 15,
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w900, backgroundColor: appColors[40]),
          unselectedItemColor: appColors[20],
          showUnselectedLabels: false,
          currentIndex: _itemIndex,
          onTap: _onTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza_outlined), label: 'Pizza'),
          ],
        ),
        body: Center(
          child: IndexedStack(
            index: _itemIndex,
            children: _page,
          ),
        ));
  }
}
