import 'package:candidateapp/pages/create_page.dart';
import 'package:candidateapp/pages/listpage.dart';
import 'package:candidateapp/pages/login_page.dart';
import 'package:candidateapp/pages/stream_page.dart';
import 'package:candidateapp/pages/stream_page_controller.dart';
import 'package:candidateapp/pages/tab_bar_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Color bgColor;
  HomePage({
    Key? key,
    required this.bgColor,
  });
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection('candidate');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(title: Text("Home")),
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
                    .limit(5)
                    .where('votes', isGreaterThan: 20)
                    .get()
                    .then((value) {
                  QuerySnapshot candidatoCollection = value;
                  List<QueryDocumentSnapshot> documentos =
                      candidatoCollection.docs;
                  documentos.forEach((element) {
                    print(element.data());
                  });
                });
              },
              child: Text("Buscar"),
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
                candidateReference.doc("idCandidateX").update({
                  'name': 'Tomyssss',
                  'votes': 50,
                  'direccion': 'lima',
                });
              },
              child: Text("Actualizar"),
            ),
            ElevatedButton(
              onPressed: () {
                candidateReference.doc("idCandidateX").delete();
              },
              child: Text("Eliminar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPage(
                      bgColor: Colors.amber.shade200,
                    ),
                  ),
                );
              },
              child: Text("Ver lista"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamPage(
                      bgColor: const Color.fromARGB(255, 167, 143, 244),
                    ),
                  ),
                );
              },
              child: Text("Ver Stream"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamPageController(
                      bgColor: Colors.green.shade200,
                    ),
                  ),
                );
              },
              child: Text("Ver Stream Controller"),
            )
          ],
        ),
      ),
    );
  }
}
