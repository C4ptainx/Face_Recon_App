import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/src/pages/forgotpasswd.dart';
class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool isRememberMe = false;

  Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Email", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white, 
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
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff455a64),
            ),
            hintText: "Email",
            hintStyle: TextStyle(
              color: Colors.black38
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
      Text("Passwrod", 
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
          color: Colors.white, 
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
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff455a64),
            ),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.black38
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
      child: Text("forgot password ?", 
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
        primary: Colors.white,
        elevation: 2, 
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed:  () => print("login pressed"),
      child: Text("Login",
        style: TextStyle(
          color: Color(0xff5ac18e),
          fontSize: 18,
        ), 
      ),
    ),
  );
}

Widget buildSignupBtn(){
  return GestureDetector(
    onTap: () => print("sign up pressed"),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don\'t have an Account?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
        
      ),
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
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff1a237e), //Color(0x665ac18e), 66, 99, cc , ff
                      Color(0xcc1a237e),
                      Color(0x991a237e),
                      Color(0xcc283593),
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
                    Text("Hola,Bienvenido", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 40, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50),
                        buildEmail(),
                    SizedBox(height: 20),
                        buildPassword(),
                        buildForgotpasswd(),
                      //  buildRememberCb(),
                        buildLoginBtn(),
                        buildSignupBtn()
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


