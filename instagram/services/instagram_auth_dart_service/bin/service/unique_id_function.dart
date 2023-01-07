import 'package:uuid/uuid.dart';

class UniqueIdFunction {
  final _uuid = Uuid();

  String getUniqueId() {
    return _uuid.v4();
  }
}