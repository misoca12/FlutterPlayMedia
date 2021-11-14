import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterPlayMedia/ui/page/chewie_page.dart';
import 'package:FlutterPlayMedia/ui/page/just_audio_page.dart';
import 'package:FlutterPlayMedia/ui/page/video_player_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Play Media'),
      ),
      body: Center(
        child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text("video_player"),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoPlayerPage())
                  )
                },
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text("chewie"),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChewiePage())
                  )
                },
              ),
              ListTile(
                leading: const Icon(Icons.audiotrack),
                title: const Text("just_audio"),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JustAudioPage())
                  )
                },
              ),
              ListTile(
                leading: const Icon(Icons.audiotrack),
                title: const Text("audioplayers"),
                onTap: () => {

                },
              ),
              ListTile(
                leading: const Icon(Icons.audiotrack),
                title: const Text("flutter_sound"),
                onTap: () => {

                },
              ),
              ListTile(
                leading: const Icon(Icons.audiotrack),
                title: const Text("soundpool"),
                onTap: () => {

                },
              ),
            ]
        ),
      )
  );
}