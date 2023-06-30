import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/Login.dart';

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
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87
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
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87
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
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
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
         obscureText: true,
          style: TextStyle(
            color: Colors.black87
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
         obscureText: true,
          style: TextStyle(
            color: Colors.black87
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
        primary: Colors.deepPurpleAccent.shade700,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed:  () => print("login pressed"),
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
                  vertical: 25
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                      )
                    ),
                    Text("Bienvenido", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 35, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                        buildusername(),
                        buildespecialidad(),
                        buildEmail(),
                        buildPassword(),
                        buildconfirm(),
                    SizedBox(height: 40),
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


