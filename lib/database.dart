import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Alunos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 50)();
  IntColumn get idade => integer()();
  BoolColumn get matricula => boolean().withDefault(const Constant(false))();
  BoolColumn get demo => boolean().withDefault(const Constant(false))();
  BoolColumn get necessidade => boolean().withDefault(const Constant(false))();
  TextColumn get condition => text().withLength(max: 20)();
  TextColumn get data => text()();
  TextColumn get numero => text()();
}

class AlunosDetalhes extends Table {
  IntColumn get alunoID => integer().references(Alunos, #id, onDelete: KeyAction.cascade)();
  TextColumn get address => text().withLength(max: 60)();
  TextColumn get cpf => text().withLength(max: 14)();
  TextColumn get rg => text().withLength(max: 12)();
  TextColumn get nacionalidade => text().withLength(max: 20)();

  TextColumn get description => text().withLength(max: 1000)();

  TextColumn get nameResp => text().withLength(max: 35)();
  TextColumn get numberResp => text().withLength(max: 12)();
  TextColumn get cpfResp => text().withLength(max: 14)();
  TextColumn get rgResp => text().withLength(max: 12)();
  TextColumn get material => text().withLength(max: 20)();
  TextColumn get estagio => text().withLength(max: 20)();
  TextColumn get inicio => text().nullable()();
  TextColumn get notas => text().nullable()();

  @override
  Set<Column> get primaryKey => {alunoID};
}

// -----------------------------------------------------------------------------

class AlunoCompleto {
  final Aluno aluno;
  final AlunosDetalhe detalhe;

  AlunoCompleto({
    required this.aluno,
    required this.detalhe,
  });
}

@DriftDatabase(tables: [Alunos, AlunosDetalhes])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createTable(alunosDetalhes);
        }

        if (from < 3) {
          await m.addColumn(alunosDetalhes, alunosDetalhes.inicio);
          await m.addColumn(alunosDetalhes, alunosDetalhes.notas);
        }
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'alunos_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<void> addAlunoFull({

    // Dados da Tabela 1
    required String nome,
    required int idade,
    required bool matricula,
    required bool demo,
    required bool necessidade,
    required String condition,
    required String data,
    required String numero,

    // Dados da Tabela 2
    required String address,
    required String cpf,
    required String rg,
    required String nacionalidade,
    required String description,
    required String nameResp,
    required String numberResp,
    required String cpfResp,
    required String rgResp,
    required String material,
    required String estagio,
    required String inicio,
    required String notas

  }) async {
    await transaction(() async {
      // 1. Salva na primeira tabela (Passando dados puros para o .insert)
      final int novoId = await into(alunos).insert(
        AlunosCompanion.insert(
          nome: nome,
          idade: idade,
          matricula: Value(matricula),
          demo: Value(demo),
          necessidade: Value(necessidade),
          condition: condition,
          data: data,
          numero: numero,
        ),
      );

      // 2. Salva na segunda tabela usando o ID que acabou de ser criado
      await into(alunosDetalhes).insert(
        AlunosDetalhesCompanion.insert(
          alunoID: Value(novoId), // Aqui passamos o ID real direto!
          address: address,
          cpf: cpf,
          rg: rg,
          nacionalidade: nacionalidade,
          description: description,
          nameResp: nameResp,
          numberResp: numberResp,
          cpfResp: cpfResp,
          rgResp: rgResp,
          material: material,
          estagio: estagio,
          inicio: Value(inicio),
          notas: Value(notas)
        ),
      );
    });
  }

  Future<List<Aluno>> findAlunosBasic(String query) {
    return (
        select(alunos)
          ..where((t) => t.nome.like('$query%'))
          ..orderBy([(t) => OrderingTerm(expression: t.nome)])
    )
        .get();
  }

  Future<List<Aluno>> findAlunosByResponsavel(String query) async {
    final typedQuery = select(alunos).join([
      innerJoin(
        alunosDetalhes,
        alunosDetalhes.alunoID.equalsExp(alunos.id),
      ),
    ]);

    typedQuery.where(alunosDetalhes.nameResp.like('$query%'));

    // Ordenar pelo nome do aluno para manter o padrão
    typedQuery.orderBy([OrderingTerm(expression: alunos.nome)]);

    final result = await typedQuery.get();

    // Mapeamos o resultado do join para retornar apenas a tabela Aluno
    return result.map((row) => row.readTable(alunos)).toList();
  }

  Future<AlunoCompleto?> findAlunoFull(int idAluno) async {
    final query = select(alunos).join([
      innerJoin(
        alunosDetalhes,
        alunosDetalhes.alunoID.equalsExp(alunos.id),
      ),
    ])
      ..where(alunos.id.equals(idAluno));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    final aluno = row.readTable(alunos);
    final detalhe = row.readTable(alunosDetalhes);

    return AlunoCompleto(
      aluno: aluno,
      detalhe: detalhe,
    );
  }

  Future<void> deleteAlunos(int idAluno) async {
    await (delete(alunos)..where((t) => t.id.equals(idAluno))).go();
  }

  Future<void> updateAlunoFull({
    required int idAluno,

    // Tabela alunos
    required String nome,
    required int idade,
    required bool matricula,
    required bool demo,
    required bool necessidade,
    required String condition,
    required String data,
    required String numero,

    // Tabela alunosDetalhes
    required String address,
    required String cpf,
    required String rg,
    required String nacionalidade,
    required String description,
    required String nameResp,
    required String numberResp,
    required String cpfResp,
    required String rgResp,
    required String material,
    required String estagio,
    required String inicio,
    required String notas,
  }) async {
    await transaction(() async {
      await (update(alunos)..where((t) => t.id.equals(idAluno))).write(
        AlunosCompanion(
          nome: Value(nome),
          idade: Value(idade),
          matricula: Value(matricula),
          demo: Value(demo),
          necessidade: Value(necessidade),
          condition: Value(condition),
          data: Value(data),
          numero: Value(numero),
        ),
      );

      await (update(alunosDetalhes)..where((t) => t.alunoID.equals(idAluno))).write(
        AlunosDetalhesCompanion(
          address: Value(address),
          cpf: Value(cpf),
          rg: Value(rg),
          nacionalidade: Value(nacionalidade),
          description: Value(description),
          nameResp: Value(nameResp),
          numberResp: Value(numberResp),
          cpfResp: Value(cpfResp),
          rgResp: Value(rgResp),
          material: Value(material),
          estagio: Value(estagio),
          inicio: Value(inicio),
          notas: Value(notas),
        ),
      );
    });
  }

  Future<List<Aluno>> findBirthday(String date) async {
    return (
        select(alunos)
          ..where((t) => t.data.like("$date%"))
          ..orderBy([(t) => OrderingTerm(expression: t.nome)])
    )
        .get();
  }
}