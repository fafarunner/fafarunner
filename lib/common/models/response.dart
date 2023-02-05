import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

class ResponseResult {
  final dynamic data;
  final int? code;

  ResponseResult(this.data, this.code);

  @override
  String toString() {
    return 'Code: $code\nData: $data';
  }

}

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class Response<T> {
  String? msg;
  int? code;
  T? data;

  Response({this.msg, this.code, this.data});

  // Interesting bits here → ----------------------------------- ↓ ↓
  factory Response.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseFromJson<T>(json, fromJsonT);

  // And here → ------------- ↓ ↓
  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$ResponseToJson<T>(this, toJsonT);
}
