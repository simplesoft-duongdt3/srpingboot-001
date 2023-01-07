class LoginRequest {
  LoginRequest({
    this.userName,
    this.password,
  });

  factory LoginRequest.fromJson(dynamic json) {
    return LoginRequest(
        userName: json['user_name'],
        password: json['password'],
    );
  }

  String? userName;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['password'] = password;
    return map;
  }
}
