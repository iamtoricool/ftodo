import 'dart:async';

import 'package:db_connector/db_connector.dart';
import 'package:ftodo/core/extensions/extensions.dart';

/// [UsersRepository] provides the methods to handle users
class UsersRepository {
  /// [UsersRepository] constructor
  UsersRepository({required this.database});

  /// [database] gets the instance of running database
  final FDatabase database;

  /// [createUser] creates an user and store that in db
  FutureOr<User?> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phone,
  }) async {
    return database.db.user.create(
      data: UserCreateInput(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password.stringToSha256,
        phone: phone,
      ),
    );
  }

  /// [deleteUser] deletes user
  FutureOr<User?> deleteUser(int id) {
    return database.db.user.delete(
      where: UserWhereUniqueInput(id: id),
    );
  }
}
