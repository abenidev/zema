// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zema/constants/strings.dart';
import 'package:zema/models/album.dart';
import 'package:zema/services/my_response.dart';
import 'package:zema/utils/error_handler.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  Future<MyResponse> getAlbums({required int page, required int pageSize}) async {
    try {
      final response = await http.get(Uri.parse('$base_url/albums?page=$page&page_size=$pageSize'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['results'] as List;
        final albums = json.map((albumJson) => Album.fromMap(albumJson)).toList();

        return MyResponse(data: albums, isSuccess: true);
      } else {
        handleError('Something went wrong');
      }
    } catch (e) {
      handleError(e);
    }
    return MyResponse(data: [], isSuccess: false);
  }
}
