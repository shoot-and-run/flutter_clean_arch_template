import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
  });

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'password')
  final String password;

  static const fromJson = _$LoginRequestFromJson;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
