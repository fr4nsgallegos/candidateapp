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
      appBar: AppBar(title: Text(pageDetails[_activePageIndex]['title'])),
      // backgroundColor: Colors.amber,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _activePageIndex = index;
          });
        },
        children: [
          pageDetails[0]['pageName'],
          pageDetails[1]['pageName'],
          pageDetails[2]['pageName'],
          pageDetails[3]['pageName'],
        ],
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
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
