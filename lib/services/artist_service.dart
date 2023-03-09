import 'dart:convert';
import 'package:zema/constants/strings.dart';
import 'package:zema/models/artist.dart';
import 'package:zema/services/my_response.dart';
import 'package:zema/utils/error_handler.dart';
import 'package:http/http.dart' as http;

class ArtistService {
  Future<MyResponse> getArtists({required int page, required int pageSize}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/artists?page=$page&page_size=$pageSize'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['results'] as List;
        final albums = json.map((artistJson) => Artist.fromMap(artistJson)).toList();

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
