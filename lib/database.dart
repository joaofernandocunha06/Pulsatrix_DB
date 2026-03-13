import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Dragons extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get height => integer()();

  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(tables: [Dragons])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'dragon_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<void> create(String name, int height) async {
    await this
        .into(dragons)
        .insert(
          DragonsCompanion.insert(
            name: name,
            height: height,
            createdAt: DateTime.now(),
          ),
        );
  }
}
