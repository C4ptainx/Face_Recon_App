import 'dart:convert';
import 'package:app/src/pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/Registrer.dart';
//import 'package:app/src/pages/User.dart';
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
        //"https://face-recon.onrender.com/api/login"
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

     // guardar(email);
      Navigator.push(context, MaterialPageRoute(builder: (context) => home() ));//print(await response.stream.bytesToString());
    
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
  
//email: admin@edu.utc.com
//password: admin1234
/*"email":"pedro@utc.edu.mx",
    "password":"pedro123456",*/

/*Future<void> guardar(email) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}


Future<void> mostrar() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = (await prefs.getString("email"))!; 
  //print(email);
  if(email != ''){
    // ignore: unnecessary_null_comparison
    if(email != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => home() ));
    }
  }
}
@override
void initState(){
  super.initState();
  mostrar();
  
}*/

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
          onChanged: (value) => {email = value},
          keyboardType: TextInputType.emailAddress,
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
         obscureText: true,
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
      onPressed: () => passwd(),
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
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent.shade700,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () async {
        main();
        
      },
      /*{
        Navigator.of(context).push(CupertinoPageRoute(builder: ((context) => home()))); 
      },*/
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
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
                  horizontal: 25,
                  vertical: 120
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Bienvenido a \n Face_Recon", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 50, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 30),
                        buildEmail(),
                         buildPassword(),
                         buildForgotpasswd(),
                    SizedBox(height: 15),
                        buildLoginBtn(),
                        buildSignupBtn()
                  ]
                ),
               ),
            ),
            /*
            Positioned(
              top: 24,
              left: 0,
              child: Image.asset('assets/diseño6.png', height: 100,),
            ),
            Positioned(
              top: 550,
              left: 200,
              child: Image.asset('assets/diseño4.png')
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}


