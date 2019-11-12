import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; 
import 'Home.dart';
List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    main();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    //controller.takePicture(path)
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }
    return  new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: new CameraPreview(controller)),
          // new Text("a"),
    //     new InkWell( child: FloatingActionButton(onPressed: () {
    //    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
    // }, ),)  
        // new Positioned(
        //   child: new GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: const Icon(
        //       Icons.close,
        //       color: Colors.grey,
        //       size: 30.0,
        //     ),
        //   ),
        //   top: 30.0,
        //   right: 10.0,
        // ),
      ]
    );
  }
}

  // FloatingActionButton(onPressed: () {
  //      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
  //   }, ),