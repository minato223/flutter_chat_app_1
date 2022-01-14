import 'package:chat_app_1/services/audio_player.dart';
import 'package:chat_app_1/services/audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;

class TestMonial extends StatefulWidget {
  const TestMonial({Key? key}) : super(key: key);

  @override
  _TestMonialState createState() => _TestMonialState();
}

class _TestMonialState extends State<TestMonial> {
  bool showPlayer = false;
  ap.AudioSource? audioSource;
  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ap.AudioPlayer();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AudioPlayer(
                    source: audioSource!,
                    onDelete: () {
                      setState(() => showPlayer = false);
                    },
                  ),
                )
              : AudioRecorder(
                  onStop: (path) {
                    setState(() {
                      audioSource = ap.AudioSource.uri(Uri.parse(path));
                      showPlayer = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
