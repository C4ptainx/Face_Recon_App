import 'dart:async';
//import 'dart:math';
//import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:app/src/pages/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final frontCamera = cameras.firstWhere(
    (camera) => camera.lensDirection == CameraLensDirection.front,
    orElse: ()=> cameras.first
  );
  //final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        camera: frontCamera,
      ),
    ),
  );
}

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;


  @override
  void initState() {
    super.initState();
     _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
   _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D737F),
      appBar: AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
          },
        ),
      backgroundColor: Color(0xFF07161B), //Colors.grey.shade900,
       title: Text("Bienvenido \n ",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
       ),
       automaticallyImplyLeading: false,
       
       toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ), 
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Container(
           width: 300,
            height: 300,
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
                } else {
                return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        /*try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

           if (!mounted) return;
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }*/
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

/*class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}*/