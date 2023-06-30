import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:app/src/pages/Registrer.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        body: Center(
          child: Column(
            children: [
              Transform.translate(
              offset: Offset(140, -2),
              child: Image.asset('assets/diseño.png', height: 140,),
              ),
              Transform.translate(
              offset: Offset(-80, -40),
              child: const Text("Hola,\n Bienvenido", style: TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 20,
              ),
              
              _userTextField(),
              _passwordTextField(),
               Container(
                padding: EdgeInsets.symmetric(vertical: 0.5),
                margin: EdgeInsets.only(left: 150),
                child: TextButton(
                  onPressed: () { 
                        Navigator.push(context, MaterialPageRoute(builder: (context) => passwd())); 
                      },
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),
              _button(),

            ],
          ),
        ),      
      ),
    );
  }
}

Widget _userTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          icon: Icon(Icons.email),
          hintText: 'ejemplo@gmail.com',
          labelText: 'correo',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          )
        ),
        onChanged: (value) {},
      ),
    );
  });
}




Widget _passwordTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          icon: Icon(Icons.key),
          hintText: 'password',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          )
        ),
        onChanged: (value) {},
      ),
    );
  });
}

Widget _button() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5.0  ,horizontal: 20.0),
          child: ElevatedButton(
            child: Text("Inicia Sesion"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              elevation: 15.0,
              side: BorderSide(
                color: Colors.purple,
              ),
          ),
          onPressed: () {},
        ),
      );
    }
  );
}
