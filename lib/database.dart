import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Alunos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 50)();
  IntColumn get idade => integer()();
  BoolColumn get matricula => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Alunos])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'alunos_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<int> addAluno(String nome, int idade, bool matricula) {
    return into(alunos).insert(
      AlunosCompanion.insert(
        nome: nome,
        idade: idade,
        matricula: Value(matricula),
      ),
    );
  }

  Future<List<Aluno>> findAlunos(String query) {
    return (select(alunos)..where((t) => t.nome.like('$query%'))).get();
  }
}