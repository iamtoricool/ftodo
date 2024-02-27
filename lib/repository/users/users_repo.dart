import 'dart:async';
import 'dart:convert';

import 'package:db_connector/db_connector.dart';

/// [UsersRepository] provides the methods to handle users
class UsersRepository {
  /// [UsersRepository] constructor
  UsersRepository({required this.database});

  /// [database] gets the instance of running database
  final FDatabase database;

  /// [createUser] creates an user and store that in db
  FutureOr<String?> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final _user = await database.db.user.create(
        data: UserCreateInput(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        ),
      );

      return jsonEncode(_user.toJson());
    } on PrismaRequestException catch (e) {
      return e.code;
    }
  }

  /// [deleteUser] deletes user
  FutureOr<User?> deleteUser(int id) {
    return database.db.user.delete(
      where: UserWhereUniqueInput(id: id),
    );
  }
}
