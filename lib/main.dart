import 'dart:async';
//import 'dart:ui';
import 'package:app/src/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:app/src/pages/Login.dart';
import 'package:rive/rive.dart';
//import 'package:rive_splash_screen/rive_splash_screen.dart';

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
     routes: {
      '/home':(context) => home(),
     },
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreen createState() => _SplashScreen();
  
  static navigate({required String name, required LoginScreen Function() next, required Future Function() until, required String startAnimation}) {}
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(Duration(seconds: 10),(){
      Navigator.of(context). pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen() ));
    }
    );
  }

  Widget build(BuildContext context){
   return const Scaffold(
    backgroundColor: Color(0xff171717),
      body: Center(
        child: RiveAnimation.asset(
          'assets/loading-tech.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
