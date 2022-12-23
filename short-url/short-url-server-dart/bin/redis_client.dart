import 'package:redis/redis.dart';

class RedisClient {
  late Command _command;

  Future<void> init() async {
    final conn = RedisConnection();
    _command = await conn.connect('localhost', 6379);
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