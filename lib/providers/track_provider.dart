import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zema/models/track.dart';
import 'package:zema/providers/player_provider.dart';
import 'package:zema/services/my_response.dart';
import 'package:zema/services/track_service.dart';

class TrackProvider extends ChangeNotifier {
  final TrackService _trackService = TrackService();

  bool isLoading = false;
  bool isInitLoaded = false;
  final List<Track> _tracks = [];
  List<Track> get tracks => _tracks;

  Future<void> getTracks(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    MyResponse myResponse = await _trackService.getTracks(page: 1, pageSize: 10);
    if (myResponse.isSuccess) {
      _tracks.addAll(myResponse.data);
      isInitLoaded = true;
      // ignore: use_build_context_synchronously
      Provider.of<PlayerProvider>(context, listen: false).initAudioPlayer(_tracks);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
