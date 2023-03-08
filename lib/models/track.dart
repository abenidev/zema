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
      'trackName': trackName,
      'trackDescription': trackDescription,
      'trackCoverImage': trackCoverImage,
      'trackAudioFile': trackAudioFile,
      'artistName': artistName,
      'albumName': albumName,
      'genreName': genreName,
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'] as int,
      trackName: map['trackName'] as String,
      trackDescription: map['trackDescription'] as String,
      trackCoverImage: map['trackCoverImage'] as String,
      trackAudioFile: map['trackAudioFile'] as String,
      artistName: map['artistName'] as String,
      albumName: map['albumName'] as String,
      genreName: map['genreName'] as String,
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
    return id.hashCode ^
        trackName.hashCode ^
        trackDescription.hashCode ^
        trackCoverImage.hashCode ^
        trackAudioFile.hashCode ^
        artistName.hashCode ^
        albumName.hashCode ^
        genreName.hashCode;
  }
}
