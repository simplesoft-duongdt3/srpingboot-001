class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = refreshToken;
    map['access_token'] = accessToken;
    return map;
  }
}
