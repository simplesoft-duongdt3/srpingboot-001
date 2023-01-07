import 'dart:io' show Platform;

class EnvironmentService {
  String get({
    required String name,
    required String defaultValue,
  }) {
    return Platform.environment[name] ?? defaultValue;
  }
//
}
