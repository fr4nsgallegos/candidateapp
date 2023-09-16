import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(
        Duration(seconds: 2),
      );
    }
  }

  Future<int> getNumber() async {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    getNumber().then((value) {
      print(value);
    });

    counter().listen((value) {
      print(value);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM PAGE"),
      ),
    );
  }
}
