import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:app/src/pages/Login.dart';
import 'package:Face_Recon/src/pages/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.of(context). pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen() ));
    }
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
     // backgroundColor: Colors.indigo[900],
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff171717), //Color(0x665ac18e), 66, 99, cc , ff 171717
                      Color(0xff171717),
                      Color(0xff171717),
                      Color(0xff171717),
                  ]
            )
          ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset('assets/logo.png', height: 430,),
            SizedBox(height: 50,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
          )
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("esta es una prueba"),
      ),
      body: Container(
        child: Center(
          child:Text("Home Page"), 
        ),
      ),
    );
  }

}

/*
Color(0xff0d47a1), //Color(0x665ac18e), 66, 99, cc , ff
 Color(0xff0d47a1),
 Color(0xcc0d47a1),  
 Color(0xcc0d47a1),                  
*/