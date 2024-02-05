import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class AudioPlayer extends StatefulWidget {
  const AudioPlayer({super.key});

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  final player = AudioPlayer();
  bool isPlaying = false;
  void playAudio(){
    setState(() {
      player.play(AssetSource('s1.wav'));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Column(children: [
       ElevatedButton(onPressed: () {
         playAudio();
       }, child: Text("Play Audio"))
      ]),),
    );
  }
}
