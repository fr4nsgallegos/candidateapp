import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST PAGE"),
      ),
      body: FutureBuilder(
        future: candidateReference.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data);
            QuerySnapshot candidateCollection = snapshot.data;
            List<QueryDocumentSnapshot> docs = candidateCollection.docs;
            print(docs.length);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
