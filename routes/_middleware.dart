import 'package:dart_frog/dart_frog.dart';
import 'package:db_connector/db_connector.dart';

Handler middleware(Handler handler) {
  return handler.use(provider<FDatabase>((context) => FDatabase.getInstance()));
}
