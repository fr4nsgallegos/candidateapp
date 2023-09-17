import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPageController extends StatefulWidget {
  @override
  State<StreamPageController> createState() => _StreamPageControllerState();
}

class _StreamPageControllerState extends State<StreamPageController> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");

  StreamController<int> myStreamController = StreamController.broadcast();

  int myCounter = 0;

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
  void dispose() {
    myStreamController.close();
    // TODO: implement dispose
    super.dispose();
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
            // Text(
            //   "0",
            //   style: TextStyle(fontSize: 50),
            // ),
            StreamBuilder(
              stream: myStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 50, color: Colors.red),
                  );
                }
                return Text(
                  "-",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                myStreamController.add(myCounter);
                myCounter += 1;
                // myCounter = myCounter + 1; //LO MISMO QUE MYCOUNTER+=1;
              },
              child: Text("Emitir"),
            ),
          ],
        ),
      ),
    );
  }
}
