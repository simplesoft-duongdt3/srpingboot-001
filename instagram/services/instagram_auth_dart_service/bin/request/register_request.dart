class RegisterRequest {
  RegisterRequest({
    this.userName,
    this.email,
    this.password,
  });

  factory RegisterRequest.fromJson(dynamic json) {
    return RegisterRequest(
        userName: json['user_name'],
        email: json['email'],
        password: json['password'],
    );
  }

  String? userName;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
