import 'package:json_annotation/json_annotation.dart';

part 'network_error.g.dart';

@JsonSerializable()
class NetworkError {
  NetworkError({
    required this.code,
    required this.message,
  });

  @JsonKey(name: 'code')
  final int code;

  @JsonKey(name: 'message')
  final String message;

  static const fromJson = _$NetworkErrorFromJson;

  Map<String, dynamic> toJson() => _$NetworkErrorToJson(this);
}
