import 'package:candidateapp/constants/constants.dart';
import 'package:candidateapp/pages/listpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Correo electrónico', style: styleItem),
        espacio(10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: boxItem,
          child: TextField(
            controller: _mailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "Ingresa tu correo",
              hintStyle: hintStyleItem,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contraseña",
          style: styleItem,
        ),
        espacio(10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxItem,
          height: 60,
          child: TextField(
            obscureText: true,
            controller: _passController,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Ingrese la contraseña",
              hintStyle: hintStyleItem,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          fondoGradient(),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/img/notes.png",
                        height: 110,
                      ),
                    ),
                  ),
                  espacio(20),
                  titulo("BLOGGER APP", 30),
                  espacio(40),
                  titulo("Inicia sesión", 25),
                  espacio(20),
                  _buildEmail(),
                  espacio(30),
                  _buildPass(),
                  espacio(50),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _auth.signInWithEmailAndPassword(
                          email: _mailController.text,
                          password: _passController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListPage(
                              bgColor: Colors.blue.shade200,
                            ),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Iniciar sesión"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
