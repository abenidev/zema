import 'dart:convert';

class Artist {
  int id;
  String artistName;
  String artistDescription;
  String artistProfileImage;

  Artist({
    required this.id,
    required this.artistName,
    required this.artistDescription,
    required this.artistProfileImage,
  });

  Artist copyWith({
    int? id,
    String? artistName,
    String? artistDescription,
    String? artistProfileImage,
  }) {
    return Artist(
      id: id ?? this.id,
      artistName: artistName ?? this.artistName,
      artistDescription: artistDescription ?? this.artistDescription,
      artistProfileImage: artistProfileImage ?? this.artistProfileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'artist_name': artistName,
      'artist_description': artistDescription,
      'artist_profileImage': artistProfileImage,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      id: map['id'] as int,
      artistName: map['artist_name'] as String,
      artistDescription: map['artist_description'] as String,
      artistProfileImage: map['artist_profileImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Artist(id: $id, artistName: $artistName, artistDescription: $artistDescription, artistProfileImage: $artistProfileImage)';
  }

  @override
  bool operator ==(covariant Artist other) {
    if (identical(this, other)) return true;

    return other.id == id && other.artistName == artistName && other.artistDescription == artistDescription && other.artistProfileImage == artistProfileImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^ artistName.hashCode ^ artistDescription.hashCode ^ artistProfileImage.hashCode;
  }
}
