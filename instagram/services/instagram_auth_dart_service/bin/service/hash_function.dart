import 'package:dbcrypt/dbcrypt.dart';

class HashFunction {
  final _dbCrypt = DBCrypt();

  String hash(String input) {
    return _dbCrypt.hashpw(input, _dbCrypt.gensalt());
  }

  bool verifyHash(String input, String hashed) {
    return _dbCrypt.checkpw(input, hashed);
  }
}
