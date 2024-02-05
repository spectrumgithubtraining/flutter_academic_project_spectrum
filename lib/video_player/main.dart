import 'package:flutter/material.dart';
import 'package:flutter_academic_project_spectrum/video_player/video_player.dart';
import 'package:flutter_academic_project_spectrum/video_player/video_player_sample.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VideoPlayerExample(),
    );
  }
}
