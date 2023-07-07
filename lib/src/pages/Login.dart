import 'dart:convert';
import 'package:app/src/pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/Registrer.dart';
import 'package:app/src/pages/Actualizar.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool isRememberMe = false;
  var email = "";
  var password = "";


  main() async {
    var headers = {"Content-Type": "application/json", "Accept" : "application/json"};
    var request = http.Request(
      'POST',
      Uri.parse(
        "https://backend-face.onrender.com/api/user/login/"
      ) 
    );
    request.body = json.encode(
      {
        "email":"$email",
        "password":"$password",
      }
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => home() ));
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
            content: Text("Su correo electronico o su contraseña son incorrectos", 
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
bool _passwordVisible = false;

  Widget buildEmail(){
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
      SizedBox(height: 0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color:  Color(0xFF3D737F),//Colors.transparent, 
          borderRadius:BorderRadius.circular(10),
         /* boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]*/
        ),
        height: 60,
        width: 350,
        child: TextField(
          onChanged: (value) => {email = value},
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
             border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                ),
              borderRadius: BorderRadius.all(
                Radius.circular(15)
                )
              ),
            contentPadding: EdgeInsets.only(top: 15),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff455a64),
            ),
            hintText: "Correo",
            hintStyle: TextStyle(
              color: Colors.white60
            )
          ),
           
        ),
      )
    ],
  );
}

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
          color:  Color(0xFF3D737F),//Colors.transparent, 
          borderRadius:BorderRadius.circular(10),
         /* boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]*/
        ),
        height: 60,
        width: 350,
        child: TextField(
         onChanged: (value) => {password = value},
          obscureText: !_passwordVisible,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
             border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent
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

Widget buildForgotpasswd(){
  return Container (
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Actualizar()));
      },
      child: Text("¿Olvidaste tu contraseña?", 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold
        ) ,
      ),
    ),
  );
}

/*Widget buildRememberCb(){
  return Container (
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white), 
        child: Checkbox(
          value: isRememberMe,
          checkColor: Colors.green,
          activeColor: Colors.white,
          onChanged: (value){
            setState(() {
              isRememberMe = value!;
            });
          },
        ),
        ),
        Text("Remember me",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}*/

Widget buildLoginBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 5, 35, 45),//Colors.deepPurpleAccent.shade700,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () async {
        main();
      },
      child: Text("Iniciar Sesion",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ), 
      ),
      
    ),
  );
}

Widget buildSignupBtn(){
  return GestureDetector(
    child: TextButton(
      child: Text("¿Necesitas una cuenta?, Registrarse",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> passwd()));
      },
    ),
  );
}

@override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF07161B),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
             /* decoration: BoxDecoration(
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
                ),*/
                child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 190
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center, // Centra la imagen en el Row
                     children: <Widget>[
                      Padding(padding: EdgeInsets.only(
                        left: 25
                      )),
                      Expanded(
                         child: Image.asset(
                           'assets/name.png', 
                            width: 350, 
                          ),
                        ),
                      ],
                    ), 
                    SizedBox(height: 50),
                   /* ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),

                    ),
                  child: Card(
                      color: Color(0xFF3D737F),//Color.fromARGB(255, 31, 30, 30),
                      child: SizedBox(
                        width: 350,
                        height: 230,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildEmail(),
                            buildPassword(),
                          ],
                        ),
                      ),
                    ),
                  ),*/
                    SizedBox(height: 10),
                    buildEmail(),
                    buildPassword(),
                        buildForgotpasswd(),
                    SizedBox(height: 40),
                        buildLoginBtn(),
                        buildSignupBtn()
                  ]
                ),
               ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}


