// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:ftodo/core/responses/response_format.dart' as crf;
import 'package:ftodo/repository/users/users_repo.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final userRepo = context.read<UsersRepository>();

  final _response = switch (context.request.method) {
    HttpMethod.delete => await _deleteUser(id, userRepo),
    _ => crf.basicResponseFormat<String?>(
        error: true,
        statusCode: HttpStatus.methodNotAllowed,
        message: 'Requested method is not allowed for this endpoint',
      ),
  };

  return _response;
}

Future<Response> _deleteUser(
  String id,
  UsersRepository usersRepository,
) async {
  // final _userId = int.parse(id);
  // final _user = await usersRepository.deleteUser(_userId);

  return crf.basicResponseFormat<String?>(
    statusCode: HttpStatus.noContent,
    message: 'User deleted successfully',
  );
}
