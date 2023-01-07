class LoginToken {
  final String accessToken;
  final String refreshToken;

  const LoginToken({
    required this.accessToken,
    required this.refreshToken,
  });
}

class PayloadToken {
  final String userName;
  final String role;

  const PayloadToken({
    required this.userName,
    required this.role,
  });

  factory PayloadToken.fromJson(dynamic json) {
    return PayloadToken(
      userName: json['user_name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['role'] = role;
    return map;
  }
}

abstract class TokenService {
  Future<LoginToken> getToken(PayloadToken payload);

  Future<String?> refreshAccessToken({required String refreshToken});

  Future<PayloadToken?> verifyAccessToken({
    required String token,
  });

  Future<PayloadToken?> verifyRefreshToken({
    required String token,
  });
}
