import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  Color bgColor;
  MapPage({
    Key? key,
    required this.bgColor,
  });
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
    );
  }
}
