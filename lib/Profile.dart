import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:connectivity/connectivity.dart';
import 'dart:async';

void main() => runApp(VideoApp());

//FirebaseDatabase database = new FirebaseDatabase();


class VideoApp extends StatefulWidget {

  @override
  _VideoAppState createState() => _VideoAppState();
}

//var connectivityResult =   (Connectivity().checkConnectivity());

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {

    //  DatabaseReference _userRef =database.reference().child('videos');

// if (connectivityResult == ConnectivityResult.mobile) {
//   // I am connected to a mobile network.
// } else if (connectivityResult == ConnectivityResult.wifi) {
//   // I am connected to a wifi network.
// }
    //   print(databaseReference);
    //   databaseReference.noSuchMethod(databaseReference)..then((DataSnapshot snapshot) {
    //   print('Data : ${snapshot.value}');
    // });
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}