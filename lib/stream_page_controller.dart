import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPageController extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");

  StreamController<int> myStreamController = StreamController();

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

  Future<int> getNumberDelay() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("INIT STREAM");
    // Stream<int> myStream = Stream.fromFuture(getNumberDelay());
    // print("STREAM CREADO");
    // counter().listen((value) {
    myStreamController.stream.listen((value) {
      print("VALOR DEL STREAM");
      print(value);
    }, onDone: () {
      print("STREAM FINALIZADO");
    }, onError: (ERROR) {
      print("ERRRRORRRRRRR");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM PAGE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                myStreamController.add(9);
              },
              child: Text("Emitir"),
            ),
          ],
        ),
      ),
    );
  }
}
