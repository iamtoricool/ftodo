import 'package:dart_frog/dart_frog.dart';

///[basicResponseFormat] basic reponse format with generic data types
Response basicResponseFormat<T>({
  int statusCode = 200,
  bool error = false,
  String? message = 'Got Response Successfully!',
  T? data,
}) {
  return Response.json(
    statusCode: statusCode,
    body: {
      'error': error,
      'message': message,
      'data': data,
    },
  );
}
