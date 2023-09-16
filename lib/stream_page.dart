import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");

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
        body: StreamBuilder(
            stream: candidateReference.snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                QuerySnapshot candidateCollection = snapshot.data;

                return Center(
                  child: Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                );
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
