import 'package:flutter/material.dart';

Widget fondoGradient() {
  return Container(
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
  );
}

Widget espacio(double space) {
  return SizedBox(
    height: space,
  );
}

Widget titulo(String titulo, double size) {
  return Text(
    titulo,
    style: TextStyle(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}

final styleItem = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
    fontSize: 20);

final boxItem = BoxDecoration(
  color: Colors.black.withOpacity(0.4),
  borderRadius: BorderRadius.circular(10),
);

final hintStyleItem = TextStyle(
  color: Colors.white54,
);
