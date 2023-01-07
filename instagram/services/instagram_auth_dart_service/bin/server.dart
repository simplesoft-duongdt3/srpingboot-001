import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'dependency_inject_init.dart';
import 'request/login_request.dart';
import 'request/refresh_token_request.dart';
import 'request/register_request.dart';
import 'response/login_response.dart';
import 'response/refresh_token_response.dart';
import 'service/database_service.dart';
import 'service/token_service.dart';

// Configure routes.
final _router = Router()
  ..post('/auth/register', _registerHandler)
  ..post('/auth/login', _loginHandler)
  ..post('/auth/refresh-token', _refreshTokenHandler)
  ..get('/auth/profile', _profileHandler);

Future<Response> _registerHandler(Request req) async {
  DatabaseService databaseService = inject();
  var body = RegisterRequest.fromJson(jsonDecode(await req.readAsString()));
  //TODO validate request body
  databaseService.createUser(
    userName: body.userName ?? '',
    email: body.email ?? '',
    passwordPlain: body.password ?? '',
    role: "user",
  );
  return Response.ok(null);
}

Future<Response> _loginHandler(Request req) async {
  DatabaseService databaseService = inject();
  TokenService tokenService = inject();
  var body = LoginRequest.fromJson(jsonDecode(await req.readAsString()));
  //TODO validate request body
  var verifyUser = await databaseService.verifyUser(
    userName: body.userName ?? '',
    passwordPlain: body.password ?? '',
  );

  if (verifyUser != null) {
    var payloadToken = PayloadToken(
      userName: verifyUser.userName,
      role: verifyUser.role,
    );
    LoginToken token = await tokenService.getToken(payloadToken);
    return Response.ok(jsonEncode(LoginResponse(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
    )), headers: {
      "Content-Type": "application/json; charset=utf-8",
    });
  }

  return Response.unauthorized(null);
}

Future<Response> _refreshTokenHandler(Request req) async {
  TokenService tokenService = inject();
  var body = RefreshTokenRequest.fromJson(jsonDecode(await req.readAsString()));
  //TODO validate request body
  String? accessToken = await tokenService.refreshAccessToken(refreshToken: body.refreshToken ?? '');
  if (accessToken != null) {
    return Response.ok(jsonEncode(RefreshTokenResponse(
      accessToken: accessToken,
    )), headers: {
      "Content-Type": "application/json; charset=utf-8",
    });
  }

  return Response.unauthorized(null);
}

Future<Response> _profileHandler(Request request) async {
  var authorization = request.headers['Authorization'];
  var prefix = 'Bearer ';
  if (authorization != null && authorization.startsWith(prefix)) {
    String token = authorization.substring(prefix.length);

    TokenService tokenService = inject();
    var verifyToken = await tokenService.verifyAccessToken(token: token);
    if (verifyToken != null) {
      return Response.ok('OK with token');
    }
  }
  return Response.unauthorized(null);
}

void main(List<String> args) async {
  await dependencyInjectInit();

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '6969');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
