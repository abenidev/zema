import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider extends ChangeNotifier {
  late AudioPlayer _audioPlayer;

  initAudioPlayer(String trackUrl) {
    _audioPlayer = AudioPlayer()..setUrl(trackUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
