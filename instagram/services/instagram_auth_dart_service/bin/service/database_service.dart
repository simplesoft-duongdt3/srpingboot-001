class UserDb {
  final String userName;
  final String email;
  final String passwordHash;
  final String role;

  const UserDb({
    required this.userName,
    required this.email,
    required this.passwordHash,
    required this.role,
  });
}

abstract class DatabaseService {
  Future<void> createUser({
    required String userName,
    required String email,
    required String passwordPlain,
    required String role,
  });

  Future<UserDb?> verifyUser({
    required String userName,
    required String passwordPlain,
  });
}