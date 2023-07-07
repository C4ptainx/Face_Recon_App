import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class passwd extends StatefulWidget{
  @override
  _passwdState createState() => _passwdState();

}
class _passwdState extends State<passwd>{
  bool isRememberMe = false;

  Widget buildusername(){
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
      SizedBox(height: 0,),
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
        width: 300,
        child: TextField(
          onChanged: (value) => {name = value},
          keyboardType: TextInputType.name,
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
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xff455a64),
            ),
            hintText: "Nombre y Apellidos",
            hintStyle: TextStyle(
              color: Colors.white60
            )
          ),
        ),
      )
    ],
  );
}

Widget buildespecialidad(){
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
        width: 300,
        child: TextField(
          onChanged: (value) => {especialidad = value},
          keyboardType: TextInputType.name,
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
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.code_outlined,
              color: Color(0xff455a64),
            ),
            hintText: "Especialidad",
            hintStyle: TextStyle(
              color: Colors.white60
            )
          ),
        ),
      )
    ],
  );
}

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
        width: 300,
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
        width: 300,
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
                color: Colors.transparent,
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
        width: 300,
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
                color: Colors.transparent,
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

Widget buildRegisterBtn(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
         primary: Color.fromARGB(255, 5, 35, 45),
        //primary: Colors.deepPurpleAccent.shade700,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () async {
        main();
        
      },
      child: Text("Registrar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ), 
      ),
    ),
  );
}

Widget buildlogin(){
  return GestureDetector(
    child: TextButton(
      child: Text("¿Ya eres usuario?, Inicar sesion",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      },
    ),
  );
}
bool _passwordVisible = false;
bool _password2Visible = false;

  var name = "";
  var especialidad = "";
  var email = "";
  var password = "";
  var password2 = "";
  main() async {
    var headers = {"Content-Type": "application/json", "Accept" : "application/json"};
    var request = http.Request(
      'POST',
      Uri.parse(
        "https://backend-face.onrender.com/api/user/register/"
      ) 
    );
    request.body = json.encode(
      {
        "name":"$name",
        "especialidad":"$especialidad",
        "email":"$email",
        "password":"$password",
        "password2":"$password2",
        "tc":"True",
      }
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201){

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
            content: Text("Error al registrar", 
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
                /*decoration: BoxDecoration(
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
                  horizontal: 35,
                  vertical: 20
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                      )
                    ),
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
                    SizedBox(height: 20),
                    ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),

                    ),
                    child: Card(
                      color: Color(0xFF07161B),  //Color.fromARGB(255, 31, 30, 30),
                      child: SizedBox(
                        width: 400,
                        height: 470,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildusername(),
                            buildespecialidad(),
                            buildEmail(),
                            buildPassword(),
                            buildconfirm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 5),
                        buildRegisterBtn(),
                        buildlogin()
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


