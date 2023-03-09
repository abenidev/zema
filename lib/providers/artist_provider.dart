import 'package:flutter/material.dart';
import 'package:zema/models/artist.dart';
import 'package:zema/services/artist_service.dart';
import 'package:zema/services/my_response.dart';

class ArtistProvider extends ChangeNotifier {
  final ArtistService _artistService = ArtistService();

  bool isLoading = false;
  bool isInitLoaded = false;
  final List<Artist> _artists = [];
  List<Artist> get artists => _artists;

  Future<void> getArtists() async {
    isLoading = true;
    notifyListeners();
    MyResponse myResponse = await _artistService.getArtists(page: 1, pageSize: 10);
    if (myResponse.isSuccess) {
      _artists.addAll(myResponse.data);
      isInitLoaded = true;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
