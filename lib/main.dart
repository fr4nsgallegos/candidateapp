import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Candidate app",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference candidateReference =
        FirebaseFirestore.instance.collection('candidates');
    candidateReference.get().then((value) {
      QuerySnapshot candidateCollection = value;
      List<QueryDocumentSnapshot> docs = candidateCollection.docs;
      print("------------------");
      // print(docs.first.data());
      docs.forEach((element) {
        print(element.id);
        print(element.data());
      });
    });
    // print("****************");
    // print(candidateReference);

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(),
    );
  }
}
