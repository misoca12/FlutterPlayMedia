import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JustAudioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JustAudioState();
}

class _JustAudioState extends State<JustAudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('just_audio'),
        ),
        body: Center(
          child: Text("aaa"),
        )
    );
  }
}