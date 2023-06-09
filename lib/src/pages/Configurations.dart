import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class settings extends StatefulWidget{
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings>{
    // ignore: override_on_non_overriding_member

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff171717),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
               child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Card(
                      child: SizedBox(
                        width: 300,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text("Esto es la configuracion")
                          ],
                        ),
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

