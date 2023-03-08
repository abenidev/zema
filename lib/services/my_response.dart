// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyResponse {
  dynamic data;
  bool isSuccess;

  MyResponse({
    required this.data,
    required this.isSuccess,
  });

  MyResponse copyWith({
    dynamic? data,
    bool? isSuccess,
  }) {
    return MyResponse(
      data: data ?? this.data,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'isSuccess': isSuccess,
    };
  }

  factory MyResponse.fromMap(Map<String, dynamic> map) {
    return MyResponse(
      data: map['data'] as dynamic,
      isSuccess: map['isSuccess'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyResponse.fromJson(String source) => MyResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyResponse(data: $data, isSuccess: $isSuccess)';

  @override
  bool operator ==(covariant MyResponse other) {
    if (identical(this, other)) return true;

    return other.data == data && other.isSuccess == isSuccess;
  }

  @override
  int get hashCode => data.hashCode ^ isSuccess.hashCode;
}
