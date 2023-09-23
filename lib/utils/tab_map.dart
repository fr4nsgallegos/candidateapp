import 'package:candidateapp/pages/home_page.dart';
import 'package:candidateapp/pages/listpage.dart';
import 'package:candidateapp/pages/stream_page.dart';
import 'package:candidateapp/pages/stream_page_controller.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    'pageName': ListPage(
      bgColor: Colors.blue.shade200,
    ),
    'title': 'Lista',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_Color': Colors.blue.shade600,
  },
  {
    'pageName': StreamPage(
      bgColor: Colors.green.shade200,
    ),
    'title': 'Lista',
    'navigationBarColor': Colors.green.shade200,
    'bottom_Color': Colors.green.shade600,
  },
  {
    'pageName': StreamPageController(
      bgColor: const Color.fromARGB(255, 167, 143, 244),
    ),
    'title': 'Lista',
    'navigationBarColor': const Color.fromARGB(255, 167, 143, 244),
    'bottom_Color': const Color.fromARGB(255, 74, 25, 238),
  },
  {
    'pageName': HomePage(bgColor: Colors.amber.shade200),
    'title': 'Lista',
    'navigationBarColor': Colors.amber.shade600,
    'bottom_Color': Colors.amber.shade600,
  }
];
