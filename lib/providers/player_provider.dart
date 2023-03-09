import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:zema/models/track.dart';

class PlayerProvider extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  AudioPlayer get audioPlayer => _audioPlayer;

  // ignore: unused_field
  String? _currentTrackUrl;

  late final ConcatenatingAudioSource _playlist;
  ConcatenatingAudioSource get playlist => _playlist;

  initAudioPlayer(List<Track> tracks) async {
    _playlist = ConcatenatingAudioSource(
      children: tracks
          .map(
            (track) => AudioSource.uri(
              Uri.parse(track.trackAudioFile),
              tag: MediaItem(
                id: track.id.toString(),
                title: track.trackName,
                artist: track.artistName,
                artUri: Uri.parse(track.trackCoverImage),
              ),
            ),
          )
          .toList(),
    );

    notifyListeners();
    _audioPlayer = AudioPlayer();

    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
