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

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection('candidate');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                candidateReference.get().then((value) {
                  QuerySnapshot candidateCollection = value;
                  List<QueryDocumentSnapshot> docs = candidateCollection.docs;
                  print("------------------");
                  docs.forEach((element) {
                    print(element.id);
                    print(element.data());
                  });
                  print("************");
                });
              },
              child: Text("Obtener data"),
            ),
            ElevatedButton(
              onPressed: () {
                candidateReference
                    .doc("idCandidateX")
                    .set(
                      {
                        "name": "ppk",
                        'votes': 13,
                        "direccion": "arequipa, peru"
                      },
                    )
                    .then((value) {})
                    .catchError((Error) {
                      print(Error);
                    });
              },
              child: Text("Agregar"),
            ),
            ElevatedButton(
                onPressed: () {
                  candidateReference
                      .add({
                        'name': 'Castillo',
                        'votes': 16,
                      })
                      .then((value) {})
                      .catchError((Error) {
                        print(Error);
                      });
                  ;
                },
                child: Text("Insercion1")),
            ElevatedButton(
              onPressed: () {
                candidateReference.doc("idCandidateX").update(
                    {'name': 'Tomyssss', 'votes': 50, 'direccion': 'lima'});
              },
              child: Text("Actualizar"),
            ),
            ElevatedButton(
              onPressed: () {
                candidateReference.doc("idCandidateX").delete();
              },
              child: Text("Eliminar"),
            ),
          ],
        ),
      ),
    );
  }
}
