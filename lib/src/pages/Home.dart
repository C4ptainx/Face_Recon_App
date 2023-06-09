import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Face_Recon/src/pages/User.dart';
//import 'package:app/src/pages/Configurations.dart';

class home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home>{
    // ignore: override_on_non_overriding_member
  Widget buildRasistencia(){
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
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
        },
        child: Text("Registrar asistencia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ), 
        ),
      ),
    );
  }

  Widget buildVasistencia(){
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
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
      },
      child: Text("Visualizar lista de asistencia",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ), 
      ),
    ),
  );
  } 

  int _selectedIndex = 0;
  List<Widget>_widgetoptions= <Widget>[
    Text(""),
    user(),
    //settings(),
  ];
  void _onItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
       backgroundColor: Colors.grey.shade900,
       title: Text("Bienvenido \n Nombre de usuario",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
       automaticallyImplyLeading: false,
       toolbarHeight: 150,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ), 
        
      ),
      
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
        ),*/ 
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 30,
               child: Image.asset('assets/diseño4.png'),
          ),
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
                   vertical: 120
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


        /*children: [
          if(_selectedIndex == 0)
          Expanded(
            child: Column(
              children: [
                SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 25,
                   vertical: 120
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                      SizedBox(height: 50),
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
        ]*/
      
     /*Stack(
            children: [
              Positioned.fill(
               child: Image.asset('assets/diseño2.png'),
              ),
            ],
          ),*/
      bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.only(bottom: 20),
            /*decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), 
                topLeft: Radius.circular(30),
              ),
             /*boxShadow: [
                BoxShadow(color: Colors.grey.shade300, spreadRadius: 0, blurRadius: 30),
              ],*/
            ),*/
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey.shade900,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",  
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: "Perfil",
                    
                  ),
                 /* BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Configuraciones",
                    
                  )*/
                ],
                
                currentIndex: _selectedIndex,
                onTap: _onItem,
                selectedItemColor: Colors.deepPurpleAccent.shade700,
                unselectedItemColor: Colors.white30,
              ),
            
            ),
          ),
    );
  }
}

/*Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                       
                          buildRasistencia(),
                          buildVasistencia(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             SizedBox(
                              width: 300,
                              height: 200,
                             ),
                            

                           ],
                          ),
                        ],
                      ),
                    ),*/

 /*child: ClipRRect(
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
                           
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  
