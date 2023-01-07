import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_multipart/form_data.dart';
import 'package:shelf_multipart/multipart.dart';
import 'package:shelf_router/shelf_router.dart';

// dart-shelf-realworld-example
// https://github.com/marcusmonteirodesouza/dart-shelf-realworld-example-app

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/upload', _uploadHandler);

Response _rootHandler(Request req) {
  return Response.ok('Instagram Upload home page!\n');
}

Future<Response> _uploadHandler(Request request) async {
  if (!request.isMultipart) {
    return Response.ok('Not a multipart request');
  } else if (request.isMultipartForm) {
    final description = StringBuffer('Parsed form multipart request\n');

    await for (final formData in request.multipartFormData) {
      description
          .writeln('${formData.name}: ${await formData.part.readString()}');
    }

    return Response.ok(description.toString());
  } else {
    final description = StringBuffer('Regular multipart request\n');

    await for (final part in request.parts) {
      description.writeln('new part');

      part.headers
          .forEach((key, value) => description.writeln('Header $key=$value'));
      final content = await part.readString();
      description.writeln('content: $content');

      description.writeln('end of part');
    }

    return Response.ok(description.toString());
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
  print('Test upload with below command');
  print('curl -X POST -H "Content-Type: multipart/mixed" -F "request={"param1": "value1"};type=application/json" http://localhost:${server.port}/upload');
}

