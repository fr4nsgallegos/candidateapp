import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF012F3D),
                Color(0xFF012F3D),
                Color(0xFF0A4F64),
                Color(0xFF0A4F64),
              ],
              stops: [0.1, 0.4, 0.6, 0.9],
            ),
          ),
        )
      ],
    );
  }
}
