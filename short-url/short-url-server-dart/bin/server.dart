import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'redis_client.dart';

String hashUrl(String url) {
  var bytes = utf8.encode(url);
  Digest digest = md5.convert(bytes);

  return digest.toString();
}
// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/create-url', _createShortUrlHandler)
  ..get('/url', _getRawUrlHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request req) {
  return Response.ok('_echoHandler Hello, World!\n');
}

Future<Response> _createShortUrlHandler(Request request) async {
  String? rawUrl = request.requestedUri.queryParameters["rawUrl"];
  if (rawUrl != null) {
    var shortUrl = hashUrl(rawUrl);

    //TODO remove it after have db impl here
    await redisClient.set(shortUrl, rawUrl);
    //save database

    return Response.ok('OK $shortUrl');
  }

  return Response.notFound(null);
}
Future<Response> _getRawUrlHandler(Request request) async {
  String? url = request.requestedUri.queryParameters["url"];
  if (url != null) {
    String? rawUrl = await redisClient.get(url);

    if(rawUrl != null) {
      return Response.ok('OK $rawUrl');
    } else {
      //TODO get from db
    }
    return Response.notFound(null);
  }

  return Response.notFound(null);
}

RedisClient redisClient = RedisClient();

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8989');
  await redisClient.init();
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}


