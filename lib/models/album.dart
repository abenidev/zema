import 'dart:convert';

class Album {
  int id;
  String albumName;
  String albumDescription;
  String albumCoverImage;
  String artistName;

  Album({
    required this.id,
    required this.albumName,
    required this.albumDescription,
    required this.albumCoverImage,
    required this.artistName,
  });

  Album copyWith({
    int? id,
    String? albumName,
    String? albumDescription,
    String? albumCoverImage,
    String? artistName,
  }) {
    return Album(
      id: id ?? this.id,
      albumName: albumName ?? this.albumName,
      albumDescription: albumDescription ?? this.albumDescription,
      albumCoverImage: albumCoverImage ?? this.albumCoverImage,
      artistName: artistName ?? this.artistName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'album_name': albumName,
      'album_description': albumDescription,
      'album_coverImage': albumCoverImage,
      'artist_name': artistName,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'] as int,
      albumName: map['album_name'] as String,
      albumDescription: map['album_description'] as String,
      albumCoverImage: map['album_coverImage'] as String,
      artistName: map['artist_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Album(id: $id, albumName: $albumName, albumDescription: $albumDescription, albumCoverImage: $albumCoverImage, artistName: $artistName)';
  }

  @override
  bool operator ==(covariant Album other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.albumName == albumName &&
        other.albumDescription == albumDescription &&
        other.albumCoverImage == albumCoverImage &&
        other.artistName == artistName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ albumName.hashCode ^ albumDescription.hashCode ^ albumCoverImage.hashCode ^ artistName.hashCode;
  }
}
