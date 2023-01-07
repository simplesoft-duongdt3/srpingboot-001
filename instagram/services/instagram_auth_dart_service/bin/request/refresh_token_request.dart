class RefreshTokenRequest {
  RefreshTokenRequest({
    this.refreshToken,
  });

  factory RefreshTokenRequest.fromJson(dynamic json) {
    return RefreshTokenRequest(
      refreshToken: json['refresh_token'],
    );
  }

  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = refreshToken;
    return map;
  }
}
