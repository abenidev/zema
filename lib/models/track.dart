import 'dart:convert';

class Track {
  int id;
  String trackName;
  String trackDescription;
  String trackCoverImage;
  String trackAudioFile;
  String artistName;
  String albumName;
  String genreName;

  Track({
    required this.id,
    required this.trackName,
    required this.trackDescription,
    required this.trackCoverImage,
    required this.trackAudioFile,
    required this.artistName,
    required this.albumName,
    required this.genreName,
  });

  Track copyWith({
    int? id,
    String? trackName,
    String? trackDescription,
    String? trackCoverImage,
    String? trackAudioFile,
    String? artistName,
    String? albumName,
    String? genreName,
  }) {
    return Track(
      id: id ?? this.id,
      trackName: trackName ?? this.trackName,
      trackDescription: trackDescription ?? this.trackDescription,
      trackCoverImage: trackCoverImage ?? this.trackCoverImage,
      trackAudioFile: trackAudioFile ?? this.trackAudioFile,
      artistName: artistName ?? this.artistName,
      albumName: albumName ?? this.albumName,
      genreName: genreName ?? this.genreName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'track_name': trackName,
      'track_description': trackDescription,
      'track_coverImage': trackCoverImage,
      'track_audioFile': trackAudioFile,
      'artist_name': artistName,
      'album_name': albumName,
      'genre_name': genreName,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'] as int,
      trackName: map['track_name'] as String,
      trackDescription: map['track_description'] as String,
      trackCoverImage: map['track_coverImage'] as String,
      trackAudioFile: map['track_audioFile'] as String,
      artistName: map['artist_name'] as String,
      albumName: map['album_name'] as String,
      genreName: map['genre_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) => Track.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Track(id: $id, trackName: $trackName, trackDescription: $trackDescription, trackCoverImage: $trackCoverImage, trackAudioFile: $trackAudioFile, artistName: $artistName, albumName: $albumName, genreName: $genreName)';
  }

  @override
  bool operator ==(covariant Track other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.trackName == trackName &&
        other.trackDescription == trackDescription &&
        other.trackCoverImage == trackCoverImage &&
        other.trackAudioFile == trackAudioFile &&
        other.artistName == artistName &&
        other.albumName == albumName &&
        other.genreName == genreName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ trackName.hashCode ^ trackDescription.hashCode ^ trackCoverImage.hashCode ^ trackAudioFile.hashCode ^ artistName.hashCode ^ albumName.hashCode ^ genreName.hashCode;
  }
}
