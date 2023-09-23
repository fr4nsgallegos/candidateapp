import 'package:candidateapp/utils/tab_map.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _activePageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: pageDetails[_activePageIndex]['tittle']),
      // backgroundColor: Colors.amber,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _activePageIndex = index;
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.amber,
        color: Colors.orange,
        buttonBackgroundColor: Colors.red,
        items: [
          Icon(Icons.home),
          Icon(Icons.people),
          Icon(Icons.list),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
