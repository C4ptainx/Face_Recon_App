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
                  top: 109.5,
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


/*
 backgroundColor: Color(0xff171717),
      appBar: AppBar(
       backgroundColor: Colors.grey.shade900,
       title: Text("Bienvenido \n Nombre de usuario",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
       automaticallyImplyLeading: true,
       toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ), 
        
      ),
      
     
     /*
      endDrawer: Drawer(
        backgroundColor: Color(0xff171717),
        child: ListView(
          children: const [
            SizedBox(
                height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff212121),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
                  ),
                ),
                
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                       right: 230.5,
                      ),
                      child: Icon(
                        Icons.cancel, 
                        color: Colors.white, 
                        size: 35,
                      ),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/usuarios.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      child: ListTile(
                        title: Text("Ricardo Oscar Perez Ortiz",
                          style:  TextStyle(
                            color: Colors.white, 
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                )
              ),
            ),
           
            SizedBox(height: 50),
            ListTile(
              title: Text("Reportar problemas", 
              style:  TextStyle(
                color: Colors.white, 
                fontSize: 20,
                fontWeight: FontWeight.normal
                ),
              ),
              leading: Icon(Icons.warning_amber, color: Colors.white, size: 35,),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text("Cerrar sesion", 
              style:  TextStyle(
                color: Colors.white, 
                fontSize: 20,
                fontWeight: FontWeight.normal
                ),
              ),
              leading: Icon(Icons.logout, color: Colors.white, size: 35,),
            )
          ],
        ),
      ),
      /* ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),*/ */
      body: Stack(
        children: [
          Column(
            children: [
              if(_selectedIndex == 0)
          Expanded(
            child: Column(
              children: [
                SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 50,
                   vertical: 150
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                      SizedBox(height: 60),
                      if(_selectedIndex == 0)buildRasistencia(),
                      SizedBox(height: 20),
                      if(_selectedIndex == 0)buildVasistencia(),
                    ]
                 ),
                ),
              ],
            ),
          ),
          if(_selectedIndex !=0) Expanded(child: _widgetoptions[_selectedIndex]),
            ],
          )
        ],
      ),



*/