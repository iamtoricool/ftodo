import 'package:orm/logger.dart';

import 'generated/prisma/prisma_client.dart';

class FDatabase {
  //----------------Singleton Instance----------------//
  FDatabase._() : db = _dbProvider();
  static FDatabase? _instance;
  factory FDatabase.getInstance() {
    return _instance ??= FDatabase._();
  }
  void dispose() => _instance = null;
  //----------------Singleton Instance----------------//

  late PrismaClient db;

  static PrismaClient _dbProvider() {
    return PrismaClient(
      stdout: Event.values,
      datasources: Datasources(
        db: String.fromEnvironment('DATABASE_URL'),
      ),
    );
  }
}
