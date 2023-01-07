import 'package:get_it/get_it.dart';

import 'service/database_service.dart';
import 'service/environment_service.dart';
import 'service/hash_function.dart';
import 'service/jwt_token_service.dart';
import 'service/memory_database_service.dart';
import 'service/token_service.dart';
import 'service/unique_id_function.dart';

GetIt getIt = GetIt.instance;

T inject<T extends Object>() => getIt.get<T>();

Future<void> dependencyInjectInit() async {
  var envService = EnvironmentService();

  getIt.registerSingleton<EnvironmentService>(envService);
  getIt.registerLazySingleton<HashFunction>(() => HashFunction());
  getIt.registerLazySingleton<UniqueIdFunction>(() => UniqueIdFunction());
  getIt.registerLazySingleton<TokenService>(() {
    return JwtTokenService(
      uniqueIdFunction: inject(),
      passphrase: envService.get(
        name: 'TOKEN_PASSPHRASE',
        defaultValue: 'default passphrase',
      ),
    );
  });
  getIt.registerLazySingleton<DatabaseService>(() {
    return MemoryDatabaseService(
      hashFunction: inject(),
    );
  });
}
