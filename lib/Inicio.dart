import 'package:flutter/material.dart';
import 'package:app/src/pages/Login.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF07161B),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Fondo con gradiente
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
             /* gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff171717),//Color(0xff171717)
                  Color(0xff171717),
                  Color(0xff171717), //Color(0xFF3D737F),
                  Color(0xff171717),
                ],
              ),*/
            ),
          ),
         /* Positioned(
            top: 0,
            left: 70,
            child: Image.asset('assets/diseño1.png'),
          ),
         Positioned(
            bottom: 0,
            left: 300,
            child: Image.asset('assets/diseño3.png'),
          ),*/
          Image.asset('assets/logo.png'),
          Positioned(
            bottom: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
               primary: Color(0xFF3D737F), //Colors.deepPurpleAccent.shade700,
               elevation: 2, 
               padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
              child: Icon(Icons.double_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
