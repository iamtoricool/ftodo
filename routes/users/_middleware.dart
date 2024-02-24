import 'package:dart_frog/dart_frog.dart';
import 'package:db_connector/db_connector.dart';
import 'package:ftodo/repository/users/users_repo.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<UsersRepository>((context) {
      final db = context.read<FDatabase>();
      return UsersRepository(database: db);
    }),
  );
}
