import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Actualizar extends StatefulWidget{
  @override
  _ActualizarState createState() => _ActualizarState();

}

class _ActualizarState extends State<Actualizar>{
  bool isRememberMe = false;

 
Widget buildPassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("", 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.transparent, 
          borderRadius:BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          onChanged: (value) => {password = value},
         obscureText: !_passwordVisible,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
                ),
              borderRadius: BorderRadius.all(
                Radius.circular(15)
                )
              ),
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff455a64),
            ), 
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                 _passwordVisible = !_passwordVisible;
                });
              },
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Color(0xff455a64),
              ),
            ),

            hintText: "Contraseña",
            hintStyle: TextStyle(
              color: Colors.white60
            )
          ),
        ),
      )
    ],
  );
}

Widget buildconfirm(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("", 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.transparent, 
          borderRadius:BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          onChanged: (value) => {password2 = value},
         obscureText: !_password2Visible,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
                ),
              borderRadius: BorderRadius.all(
                Radius.circular(15)
                )
              ),
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff455a64),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _password2Visible = !_password2Visible;
                });
              },
              child: Icon(
                  _password2Visible ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xff455a64),
                ),
              ),
            hintText: "Confirmar contraseña",
            hintStyle: TextStyle(
              color: Colors.white60
            )
          ),
        ),
      )
    ],
  );
}

Widget buildRequisitos() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Requisitos de contraseña:',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white),
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text('Al menos 8 caracteres',
        style: TextStyle( color: Colors.white),),
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text('Al menos una letra mayúscula',
        style: TextStyle( color: Colors.white),),
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text('Al menos un número',
        style: TextStyle( color: Colors.white),),
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text('Al menos un carácter especial',
        style: TextStyle( color: Colors.white),),
        ],
      ),
      Divider(),
    ],
  );
}

bool _passwordVisible = false;
bool _password2Visible = false;

var password = "";
var password2 = "";

main() async {
    var headers = {"Content-Type": "application/json", "Accept" : "application/json"};
    var request = http.Request(
      'POST',
      Uri.parse(
        "https://backend-face.onrender.com/api/user/changepassword/"
      ) 
    );
    request.body = json.encode(
      {
        "password":"$password",
        "password2":"$password2",
      }
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200){

     // guardar(email);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));//print(await response.stream.bytesToString());
    
    // Navigator.push(context, MaterialPageRoute(builder: ((context) => home())));
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            backgroundColor: Colors.blueGrey.shade800,
            title: Text("Error",
             style: TextStyle(color: Colors.white),
            ),
            content: Text("Error al cambiar contraseña", 
             style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar", 
                 style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }
      );
    }
  }


@override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff171717),
       automaticallyImplyLeading: false,

      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
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
               child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 45
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                      )
                    ),
                    Text("Cambiar Contraseña", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 35, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 100),
                        buildPassword(),
                    SizedBox(height: 40),
                      buildRequisitos(),
                      buildconfirm()
                       
                  ]
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


