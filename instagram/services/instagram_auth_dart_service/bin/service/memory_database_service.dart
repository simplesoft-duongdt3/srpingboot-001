import 'package:collection/collection.dart';

import 'database_service.dart';
import 'hash_function.dart';

class MemoryDatabaseService extends DatabaseService {
  final HashFunction hashFunction;

  MemoryDatabaseService({
    required this.hashFunction,
  });

  final List<UserDb> _users = List.empty(growable: true);

  @override
  Future<void> createUser({
    required String userName,
    required String email,
    required String passwordPlain,
    required String role,
  }) async {
    String passwordHash = hashFunction.hash(passwordPlain);
    _users.add(UserDb(
      userName: userName,
      email: email,
      passwordHash: passwordHash,
      role: role,
    ));
  }

  @override
  Future<UserDb?> verifyUser({
    required String userName,
    required String passwordPlain,
  }) async {
    var firstUser =
        _users.firstWhereOrNull((user) => user.userName == userName);
    if (firstUser != null) {
      bool isValidPass =
          hashFunction.verifyHash(passwordPlain, firstUser.passwordHash);
      if (isValidPass) {
        return firstUser;
      }
    }
    return null;
  }
}
