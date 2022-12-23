import 'package:redis/redis.dart';
import 'dart:io' show Platform;

class RedisClient {
  late Command _command;

  Future<void> init() async {
    Map<String, String> envVars = Platform.environment;
    var host = envVars['REDIS_HOSTS'] ?? 'localhost';
    var port = int.parse(envVars['REDIS_PORT'] ?? '6379');

    final conn = RedisConnection();
    _command = await conn.connect(host, port);
  }

  Future<void> set(String key, String value) async {
    await _command.set(key, value);
  }

  Future<dynamic> get(String key) async {
    return await _command.get(key);
  }

  Future<dynamic> setExpire(String key, int seconds) async {
    await _command.send_object(["EXPIRE", key, "$seconds"]);
  }

  Future<dynamic> removeExpire(String key) async {
    await _command.send_object(["PERSIST", key]);
  }
}
