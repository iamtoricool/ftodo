import 'package:db_connector/db_connector.dart';
import 'package:test/test.dart';

void main() {
  test('Singleton Database Initialization Test', () {
    // Create multiple instances of FDatabase
    final db1 = FDatabase.getInstance();
    final db2 = FDatabase.getInstance();

    // Check if both instances point to the same object
    expect(db1, equals(db2));

    // Dispose one instance
    db1.dispose();

    // Attempt to create a new instance
    final db3 = FDatabase.getInstance();

    // Ensure that the new instance is different from the disposed one
    expect(db1, isNot(equals(db3)));
  });
}
