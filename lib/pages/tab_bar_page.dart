import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.amber,
        color: Colors.orange,
        buttonBackgroundColor: Colors.red,
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.people),
          Icon(Icons.list),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
