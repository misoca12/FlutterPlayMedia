import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:soundpool/soundpool.dart';

class SoundPoolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SoundPoolState();

}

class _SoundPoolState extends State<SoundPoolPage> {

  Soundpool pool = Soundpool.fromOptions();
  int _soundId = 0;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _soundId = await rootBundle.load("assets/samples/beep.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
    setState(() => _isReady = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('soundpool'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Play'),
          onPressed:  !_isReady ? null : () {
            pool.play(_soundId);
          }
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pool.dispose();
  }
}