import 'package:flutter/material.dart';

class passwd extends StatefulWidget{
  @override
  _passwdState createState() => _passwdState();

}

class _passwdState extends State<passwd> {
  @override
  Widget build (BuildContext context){
    return SafeArea (
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('hola como estas '),
            ],
          ),
        ),
      ),
      

    );
  }
}