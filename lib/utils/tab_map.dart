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
      bgColor: Colors.blue.shade200,
    ),
    'title': 'Lista',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_Color': Colors.blue.shade600,
  },
  {
    'pageName': StreamPageController(
      bgColor: Colors.blue.shade200,
    ),
    'title': 'Lista',
    'navigationBarColor': Colors.blue.shade200,
    'bottom_Color': Colors.blue.shade600,
  }
];
