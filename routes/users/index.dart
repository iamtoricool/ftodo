// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:ftodo/core/responses/response_format.dart' as crf;
import 'package:ftodo/repository/users/users_repo.dart';

Future<Response> onRequest(RequestContext context) async {
  final userRepo = context.read<UsersRepository>();
  final response = switch (context.request.method) {
    HttpMethod.post => await _createUser(context, userRepo),
    _ => crf.basicResponseFormat<String?>(
        error: true,
        statusCode: HttpStatus.methodNotAllowed,
        message: 'Requested method is not allowed for this endpoint',
      ),
  };

  return response;
}

Future<Response> _createUser(
  RequestContext context,
  UsersRepository usersRepository,
) async {
  try {
    final _reqBody = await context.request.body();
    if (_reqBody.isEmpty) {
      return crf.basicResponseFormat<String?>(
        error: true,
        statusCode: HttpStatus.badRequest,
        message: 'Request body cannot be empty',
      );
    }

    final _decodedBody = jsonDecode(_reqBody);

    if (_decodedBody == null || _decodedBody is! Map<String, dynamic>) {
      return crf.basicResponseFormat<String?>(
        error: true,
        statusCode: HttpStatus.badRequest,
        message: 'Invalid data structure',
      );
    }

    final _requiredFields = [
      'first_name',
      'last_name',
      'email',
      'password',
    ];

    final _missingOrEmptyFields = _requiredFields.where((field) {
      return _decodedBody[field] == null ||
          (_decodedBody[field]?.toString().trim().isEmpty ?? true);
    }).toList();

    if (_missingOrEmptyFields.isNotEmpty) {
      return crf.basicResponseFormat<String?>(
        error: true,
        statusCode: HttpStatus.badRequest,
        message: '${_missingOrEmptyFields.first} is required',
      );
    }

    final _response = await usersRepository.createUser(
      firstName: _decodedBody['first_name'] as String,
      lastName: _decodedBody['last_name'] as String,
      email: _decodedBody['email'] as String,
      password: _decodedBody['password'] as String,
    );

    if (_response != null) {
      return crf.basicResponseFormat(
        data: _response,
      );
    }
  } catch (e) {
    print(e);
  }
  return crf.basicResponseFormat<dynamic>(
    error: true,
    statusCode: HttpStatus.internalServerError,
    message: 'Something went wrong, please try again later',
  );
}
