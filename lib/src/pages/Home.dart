import 'package:flutter/material.dart';
import 'package:app/src/pages/Login.dart';
import 'package:app/src/pages/User.dart';
import 'package:app/src/pages/AsistenciaR.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:camera/camera.dart';

class home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home>{
    // ignore: override_on_non_overriding_member
  Widget buildRasistencia(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF07161B),//Colors.deepPurpleAccent.shade700,
          elevation: 2, 
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
            WidgetsFlutterBinding.ensureInitialized();
            final cameras = await availableCameras();
            final firstCamera = cameras.first;
            Navigator.push(context,MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera)));
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
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
    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF07161B),//Colors.deepPurpleAccent.shade700,
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
  // Función para realizar el logout
Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token'); 
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),(route) => false,);
}
  

  @override
  
  Widget build (BuildContext context){
    return MaterialApp(
     // backgroundColor: Color(0xff171717),
     debugShowCheckedModeBanner: false,
      home: Hoome(
        buildRasistencia: buildRasistencia,
        buildVasistencia: buildVasistencia,
        selectedIndex: _selectedIndex,
        widgetoptions: _widgetoptions,
        onItem: _onItem,
        logout: logout,
       
      ),
   /*   appBar: AppBar(
       backgroundColor: Colors.grey.shade900,
       title: Text("Bienvenido \n ",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
       automaticallyImplyLeading: false,
       leading: Builder(
          builder: (context){
            return IconButton( 
              icon: Icon(Icons.notes_rounded),
               onPressed: (){
                 Scaffold.of(context).openDrawer();
              }
            );
          }
        ),
       toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ), 
        
      ),  */  
   /*   drawer: Drawer(
        backgroundColor: Color(0xff171717),
        child: ListView(
          children: <Widget> [
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
                       left: 230.5,
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
                    ),
                  ],
                ),
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
              leading: Icon(Icons.logout, color: Colors.white, size: 35),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),*/

      /* ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),*/ 
  /*   body: Stack(
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
      bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.only(bottom: 20),
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
                ],
                
                currentIndex: _selectedIndex,
                onTap: _onItem,
                selectedItemColor: Colors.deepPurpleAccent.shade700,
                unselectedItemColor: Colors.white30,
              ),
            
            ),
          ),*/
    );
  }
}
class Hoome extends StatelessWidget{
  final Widget Function() buildRasistencia;
  final Widget Function() buildVasistencia;
  final int selectedIndex;
  final List <Widget> widgetoptions;
  final Function(int) onItem;
  final void Function(BuildContext) logout;
  Hoome (
    {
      required this.buildRasistencia, 
      required this.buildVasistencia, 
      required this.onItem, 
      required this.selectedIndex, 
      required this.widgetoptions,
      required this.logout
    }
  );

  @override
  Widget build(BuildContext context){
    return ZoomDrawer(
      menuScreen: Menu(
        logout: logout,
      ), 
        mainScreen: Main(
          buildRasistencia: buildRasistencia, 
          buildVasistencia: buildVasistencia, 
          selectedIndex: selectedIndex,
          onItem: onItem,
          widgetoptions: widgetoptions
        ),
        borderRadius: 24,
        showShadow: true,
        drawerShadowsBackgroundColor: Color(0xFF3D737F),//Colors.grey.shade700,
        menuBackgroundColor: Color(0xFF07161B),//Colors.grey.shade900,
    );
  }
}

class Main extends StatelessWidget{
  final Widget Function() buildRasistencia; 
  final Widget Function() buildVasistencia; 
  final int selectedIndex;
  final List <Widget> widgetoptions;
  final Function(int) onItem;
 
  Main(
    {
      required this.buildRasistencia, 
      required this.buildVasistencia,
      required this.selectedIndex,
      required this.onItem,
      required this.widgetoptions,
    }
  );

  @override
  Widget build (BuildContext context){
    return Scaffold(
       backgroundColor: Color(0xFF3D737F) ,//Color(0xff171717),
      appBar: AppBar(
        backgroundColor: Color(0xFF07161B), //Colors.grey.shade900,
       title: Text("Bienvenido \n ",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
       automaticallyImplyLeading: false,
       leading: IconButton(
        onPressed: ()=>ZoomDrawer.of(context)!.toggle(), 
        icon: Icon(Icons.notes_rounded)
        ),
       toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ), 
      ),
       body: Stack(
        children: [
          Positioned(
            bottom: 310,
            right: 180,
            child: Image.asset('assets/diseño1.png'),
          ),
          Positioned(
            top: 360,
            left: 240,
            child: Image.asset('assets/diseño2.png'),
          ),
          Column(
            children: [
              if(selectedIndex == 0)
              
          Expanded(
            child: Column(
              children: [
                
                SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 25,
                   vertical: 200
                  ),
                
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    SizedBox(height: 20),
                    if(selectedIndex == 0)
                    buildRasistencia(),
                    SizedBox(height: 20),
                    if(selectedIndex == 0)
                    buildVasistencia(),
                    ]
                 ),
                ),
              ],
            ),
          ),
         
          if(selectedIndex !=0) 
            Expanded(
              child: widgetoptions[
               selectedIndex
              ]
            ),
          ],
        )
      ],
    ),
      bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            margin: EdgeInsets.only(bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              child: BottomNavigationBar(
                backgroundColor: Color(0xFF07161B),//Colors.grey.shade900,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",  
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: "Perfil",
                  ),
                ],
               currentIndex: selectedIndex,
               onTap: onItem,
                selectedItemColor: Color(0xFF3D737F) ,//Colors.deepPurpleAccent.shade700,
                unselectedItemColor: Colors.white30,
              ),
            
            ),
          )
    );
  }
}

class Menu extends StatelessWidget{
 final void Function(BuildContext) logout;

 Menu({required this.logout});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF07161B),//Color(0xff212121),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(padding: EdgeInsets.only(right: 180),
              child: IconButton(
                onPressed: ()=>ZoomDrawer.of(context)!.close(), 
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.white, 
                    size: 35
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/usuarios.png'),
                backgroundColor: Colors.grey.shade600,
              ),
              ),
              
              SizedBox(height: 30),
              ListTile(
                title: Text("nombre usuario o correo", style: TextStyle(
                color: Colors.white, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
              ),
              ),
              SizedBox(height: 35),
            ],
          ),
          ListTile(
            leading: Icon(Icons.support_agent_rounded, color: Colors.white, size: 35,),
            title: Text(
              "Soporte", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            
          ),
          SizedBox(height: 300,),
          Padding(padding: EdgeInsets.only(left: 15),
          child: Text("Version 1.0.0",style: TextStyle(color: Colors.grey.shade300, fontSize: 15 ),),
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 30,
            color: Colors.grey.shade100,
          ),
           ListTile(
            leading: Icon(Icons.logout_sharp, color: Colors.white, size: 35,),
            title: Text(
              "Cerrar Sesión", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
              
            ),
            onTap: () {
              logout(context);
            },
          )
        ],
      ),
    );
  }

  static of(BuildContext context) {}
}