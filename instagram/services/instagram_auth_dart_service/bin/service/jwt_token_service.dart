import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'token_service.dart';
import 'unique_id_function.dart';

const String _tokenTypeKey = 'tt';
const String _accessType = 'access';
const String _refreshType = 'refresh';

class JwtTokenService extends TokenService {
  final String passphrase;
  final UniqueIdFunction uniqueIdFunction;

  JwtTokenService({
    required this.passphrase,
    required this.uniqueIdFunction,
  });

  String _genJwtToken(
      PayloadToken payload, Duration duration, String tokenType) {
    final jwt = JWT(
      payload.toJson()
        ..addAll({
          _tokenTypeKey: tokenType,
        }),
      jwtId: uniqueIdFunction.getUniqueId(),
    );

    return jwt.sign(
      SecretKey(passphrase),
      algorithm: JWTAlgorithm.HS256,
      expiresIn: duration,
    );
  }

  String _genAccessToken(PayloadToken payload) {
    return _genJwtToken(payload, Duration(minutes: 30), _accessType);
  }

  String _genRefreshToken(PayloadToken payload) {
    return _genJwtToken(payload, Duration(days: 30), _refreshType);
  }

  @override
  Future<LoginToken> getToken(PayloadToken payload) async {
    String accessToken = _genAccessToken(payload);
    String refreshToken = _genRefreshToken(payload);
    return LoginToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  Future<String?> refreshAccessToken({required String refreshToken}) async {
    var payload = await verifyRefreshToken(token: refreshToken);
    if (payload != null) {
      return _genAccessToken(payload);
    }
    return null;
  }

  Future<PayloadToken?> _verifyToken({
    required String token,
    required String tokenType,
  }) async {
    var tryVerify = JWT.tryVerify(
      token,
      SecretKey(passphrase),
      checkExpiresIn: true,
    );
    if (tryVerify != null && tryVerify.payload[_tokenTypeKey] == tokenType) {
      return PayloadToken.fromJson(tryVerify.payload);
    }
    return null;
  }

  @override
  Future<PayloadToken?> verifyAccessToken({required String token}) {
    return _verifyToken(
      token: token,
      tokenType: _accessType,
    );
  }

  @override
  Future<PayloadToken?> verifyRefreshToken({required String token}) {
    return _verifyToken(
      token: token,
      tokenType: _refreshType,
    );
  }
}
