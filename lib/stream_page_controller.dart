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
    print("INIT STREAM");
    // Stream<int> myStream = Stream.fromFuture(getNumberDelay());
    print("STREAM CREADO");
    counter().listen((value) {
      print("VALOR DEL STREAM");
      print(value);
    }, onDone: () {
      print("STREAM FINALIZADO");
    }, onError: (ERROR) {
      print("ERRRRORRRRRRR");
    });
    // getNumber().then((value) {
    //   print(value);
    // });

    // counter().listen((value) {
    //   print(value);
    // });

    return Scaffold(
        appBar: AppBar(
          title: Text("STREAM PAGE"),
        ),
        body: StreamBuilder(
            stream: candidateReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot candidateCollection = snapshot.data;
                return ListView.builder(
                  itemCount: candidateCollection.size,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> myDoc = candidateCollection.docs[index]
                        .data() as Map<String, dynamic>;
                    myDoc["id"] = candidateCollection.docs[index].id;
                    return ListTile(
                      title: Text(
                        myDoc["name"],
                      ),
                      subtitle: Text(
                        myDoc["id"],
                      ),
                    );
                  },
                );

                // return Center(
                //   child: Text(
                //     snapshot.data.toString(),
                //     style: TextStyle(fontSize: 50),
                //   ),
                // );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })

        //FUTURE BUILDER TRABAJA CON UN FUTURE
        // FutureBuilder(
        //   future: getNumber(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(
        //         snapshot.data.toString(),
        //         style: TextStyle(fontSize: 50),
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        );
  }
}
