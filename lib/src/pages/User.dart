import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class user extends StatefulWidget{
  @override
  _userState createState() => _userState();
}

class _userState extends State<user>{
    // ignore: override_on_non_overriding_member
 
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF3D737F),//Color(0xff171717),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
                Positioned(
            bottom: 360,
            right: 180,
            child: Image.asset('assets/diseño1.png'),
          ),
          Positioned(
            top: 360,
            left: 240,
            child: Image.asset('assets/diseño2.png'),
          ),
              Container(
                height: double.infinity,
                width: double.infinity,
               child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 60,
                  left: 25,
                  right: 25
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    
                    child: Card(
                      color: Color(0xFFCEC7BF),
                      child: SizedBox(
                        width: 300,
                        height: 550,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 100),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color.fromARGB(255, 208, 180, 148),
                                    backgroundImage: AssetImage('assets/usuarios.png'),
                                    radius: 70,
                                  ),
                                  SizedBox(height: 85),
                                  Text("Nombre Apellido Materno ", style: TextStyle(color: Colors.black, fontSize: 20),),
                                  SizedBox(height: 25),
                                  Text("Correo Electronico ", style: TextStyle(color: Colors.black, fontSize: 20),),
                                  SizedBox(height: 25),
                                 Text("Especiaidad ", style: TextStyle(color: Colors.black, fontSize: 20),),
                                ],
                              ) 
                            ),
                          ],
                        )
                        ,
                      ),
                      
                    ),
                  ),
               ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//Color(0xFFCEC7BF) beige
//Color(0xFF3D737F) ver azulado
//Color(0xFF07161B) negro