import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  Color bgColor;
  StreamPage({
    Key? key,
    required this.bgColor,
  });
  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");

  StreamController<int> myStreamController = StreamController();
  StreamController streamCounter = StreamController();

  streamCounterController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      print("el valor es");
      streamCounter.add(i);
    }
  }

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
  void initState() {
    streamCounterController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    streamCounter.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("INIT STREAM");
    print("STREAM CREADO");
    streamCounter.stream.listen((value) {
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
                      trailing: Text(myDoc["votes"].toString()),
                      onTap: () {
                        candidateReference.doc(myDoc["id"]).update({
                          'votes': myDoc['votes'] + 1,
                        });
                      },
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
