import 'package:candidateapp/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
                    onPressed: () {},
                    child: Text("Iniciar sesión"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
