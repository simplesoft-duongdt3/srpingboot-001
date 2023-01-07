class RefreshTokenResponse {
  RefreshTokenResponse({
    this.accessToken,
  });

  factory RefreshTokenResponse.fromJson(dynamic json) {
    return RefreshTokenResponse(
      accessToken: json['access_token'],
    );
  }

  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    return map;
  }
}
