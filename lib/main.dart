import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/src/pages/Login.dart';
import 'package:app/src/pages/Login1.dart';

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
      backgroundColor: Colors.indigo[900],
      body: Center(
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