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
          color: Color(0xFF3D737F),//Colors.transparent, 
          borderRadius:BorderRadius.circular(10),
          /*boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]*/
        ),
        height: 60,
        child: TextField(
          onChanged: (password) => onPasswordChanged(password),
          //onChanged: (value) => {password = value},
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
        color: Color(0xFF3D737F),//Colors.transparent, 
        borderRadius:BorderRadius.circular(10),
        
          /*boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]*/
        ),
        height: 60,
        child: TextField(
         
          onChanged: (value) => {password2 = value},
         obscureText: !_password2Visible,
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

Widget buildCambiarBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
         primary: Color.fromARGB(255, 5, 35, 45),
       // primary: Colors.deepPurpleAccent.shade700,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () async {
        main();
        
      },
      child: Text("Cambiar contraseña",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ), 
      ),
    ),
  );
}

Widget buildprueba() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _isPasswordEightCharacters ? Colors.green : Colors.transparent,
                border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent): 
                Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Icon(
                  Icons.check, 
                  color: Colors.white, 
                  size: 15
                ),
              ),
            ),
            SizedBox(width: 10,),
             Text("Debería tener 8 carácteres como mínimo", style: TextStyle(color: Colors.white),),
        ],
      ),
      SizedBox(height: 10,),
       Row(
        children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _hasPasswordOneNumber ? Colors.green : Colors.transparent,
                border:_hasPasswordOneNumber ? Border.all(color: Colors.transparent): 
                Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Icon(
                  Icons.check, 
                  color: Colors.white, 
                  size: 15
                ),
              ),
            ),
            SizedBox(width: 10,),
             Text("Al menos deberia de tener un número", style: TextStyle(color: Colors.white),),
        ],
      ),
      SizedBox(height: 10,),
       Row(
        children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _hasPasswordLetraM ? Colors.green : Colors.transparent,
                border:  _hasPasswordLetraM ? Border.all(color: Colors.transparent): 
                Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Icon(
                  Icons.check, 
                  color: Colors.white, 
                  size: 15
                ),
              ),
            ),
            SizedBox(width: 10,),
             Text("Al menos deberia de tener una letra mayuscula", style: TextStyle(color: Colors.white),),
        ],
      ),
      SizedBox(height: 10,),
       Row(
        children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _hasPasswordLetram ? Colors.green : Colors.transparent,
                border:_hasPasswordLetram ? Border.all(color: Colors.transparent): 
                Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Icon(
                  Icons.check, 
                  color: Colors.white, 
                  size: 15
                ),
              ),
            ),
            SizedBox(width: 10,),
             Text("Al menos deberia de tener una letra miniscula", style: TextStyle(color: Colors.white),),
        ],
      )
    ],
  );
}
onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
   // final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    final letran = RegExp(r'[a-z]');
    final letram = RegExp(r'[A-Z]');

    setState(() {

      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
      
      _hasPasswordLetram = false;
      if(letran.hasMatch(password))
        _hasPasswordLetram = true;

      _hasPasswordLetraM = false;
      if(letram.hasMatch(password))
        _hasPasswordLetraM = true;
    }
    );
  }


bool _isPasswordEightCharacters = false;
bool _hasPasswordOneNumber = false;
bool _hasPasswordLetram = false;
bool _hasPasswordLetraM = false;

final TextEditingController controller = TextEditingController();
bool success = false;
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
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
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
      backgroundColor: Color(0xFF07161B), 
       appBar: AppBar(
        backgroundColor: Color(0xFF07161B), //Color(0xff171717),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          },
        ),
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
                  /*gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff171717), //Color(0x665ac18e), 66, 99, cc , ff 171717
                      Color(0xff171717),
                      Color(0xff171717),
                      Color(0xff171717),
                    ]
                  )*/
                ),
               child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 80,
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
                    SizedBox(height: 30),
                        buildPassword(),  
                    SizedBox(height: 50),
                      buildprueba(),
                      buildconfirm(),
                     SizedBox(height: 50),
                      buildCambiarBtn()
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

