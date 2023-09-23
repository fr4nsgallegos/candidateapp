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
          pageDetails[4]['pageName'],
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: pageDetails[_activePageIndex]['navigationBarColor'],
        color: pageDetails[_activePageIndex]['bottom_Color'],
        // buttonBackgroundColor: pageDetails[_activePageIndex]['bottom_Color'],
        items: [
          Icon(Icons.home),
          Icon(Icons.people),
          Icon(Icons.list),
          Icon(Icons.add),
          Icon(Icons.map_rounded)
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
