import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_media/common/just_audio_common.dart';

class AudioplayersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AudioplayersState();
}

class _AudioplayersState extends State<AudioplayersPage> with WidgetsBindingObserver {
  final _player = AudioPlayer();
  Duration? _duration;
  Duration? _position;
  PlayerState _state = PlayerState.STOPPED;

  @override
  void initState() {
    super.initState();
    _setup();
    _play();
  }

  void _setup() {
    _player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });
    _player.onAudioPositionChanged.listen((Duration d) {
      setState(() => _position = d);
    });
    _player.onPlayerStateChanged.listen((PlayerState state) {
      setState(() => _state = state);
    });
    _player.onPlayerCompletion.listen((event) {
      setState(() => _position = Duration(milliseconds: 0));
    });
  }

  Future<void> _play() async {
    var result = await _player.play( "https://luan.xyz/files/audio/ambient_c_motion.mp3", position: _position);
    if (result == 1) {
      setState(() => _state = PlayerState.PLAYING);
    }
  }

  Future<void> _pause() async {
    var result = await _player.pause();
    if (result == 1) {
      setState(() => _state = PlayerState.PAUSED);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('audioplayers'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display play/pause button and volume/speed sliders.
              Visibility(
                visible: _state != PlayerState.PLAYING,
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 64.0,
                  onPressed: () {
                    _play();
                  },
                ),
              ),
              Visibility(
                visible: _state == PlayerState.PLAYING,
                child: IconButton(
                  icon: Icon(Icons.pause),
                  iconSize: 64.0,
                  onPressed: () async {
                    _pause();
                  },
                ),
              ),
              SeekBar(
                duration: _duration ?? Duration.zero,
                position: _position ?? Duration.zero,
                bufferedPosition: Duration.zero,
                onChangeEnd: _player.seek,
              ),
            ],
          ),
        ),
    );
  }
}
