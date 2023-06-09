import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class user extends StatefulWidget{
  @override
  _userState createState() => _userState();
}

class _userState extends State<user>{
    // ignore: override_on_non_overriding_member

Widget buildRasistencia(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade900,
          elevation: 2, 
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: (){
          
        },
        child: Text("Ricardo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ), 
        ),
      ),
    );
  }
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
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 25
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
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text("esto es para el usuario"),
                           buildRasistencia(),
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
