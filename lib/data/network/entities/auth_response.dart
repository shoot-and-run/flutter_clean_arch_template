import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    required this.token,
  });

  @JsonKey(name: 'token')
  final String token;

  static const fromJson = _$AuthResponseFromJson;

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
