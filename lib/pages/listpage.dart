import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  Color bgColor;
  ListPage({
    Key? key,
    required this.bgColor,
  });
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("candidate");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                // print(docs[index].data());
                Map<String, dynamic> myDoc =
                    docs[index].data() as Map<String, dynamic>;
                myDoc["id"] = docs[index].id;
                print("-------------------------");
                print(docs[index].data());
                print(myDoc["id"]);
                print(myDoc);
                return ListTile(
                  title: Text(myDoc["name"]),
                  subtitle: Text(myDoc["id"]),
                  trailing: Text(myDoc["votes"].toString()),
                  onTap: () {
                    candidateReference.doc(myDoc["id"]).update({
                      'votes': myDoc['votes'] + 1,
                    });
                  },
                );
                // Text(myDoc["name"]);
              },
            );
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
