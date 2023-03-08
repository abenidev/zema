import 'package:flutter/material.dart';
import 'package:zema/models/album.dart';
import 'package:zema/services/album_service.dart';
import 'package:zema/services/my_response.dart';

class AlbumProvider extends ChangeNotifier {
  final AlbumService _albumService = AlbumService();

  bool isLoading = false;
  final List<Album> _albums = [];
  List<Album> get albums => _albums;

  Future<void> getAlbums() async {
    isLoading = true;
    notifyListeners();
    MyResponse myResponse = await _albumService.getAlbums(page: 1, pageSize: 10);
    if (myResponse.isSuccess) {
      _albums.addAll(myResponse.data);
    }
    isLoading = false;
    notifyListeners();
  }
}
