import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  // ignore: unused_field
  String? _currentTrackUrl;

  AudioPlayer get audioPlayer => _audioPlayer;

  initAudioPlayer(String trackUrl) {
    _audioPlayer = AudioPlayer()..setUrl(trackUrl);
    setCurrentTrackUrl(trackUrl);
  }

  setCurrentTrackUrl(String trackUrl) {
    _currentTrackUrl = trackUrl;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
