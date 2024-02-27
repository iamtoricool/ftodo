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
        db: 'postgres://postgres.ocuxbhvbpokefaihneme:Testpass1214@@!@aws-0-us-west-1.pooler.supabase.com:5432/postgres',
      ),
    );
  }
}
