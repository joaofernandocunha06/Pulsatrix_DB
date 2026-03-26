// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AlunosTable extends Alunos with TableInfo<$AlunosTable, Aluno> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlunosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idadeMeta = const VerificationMeta('idade');
  @override
  late final GeneratedColumn<int> idade = GeneratedColumn<int>(
    'idade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _matriculaMeta = const VerificationMeta(
    'matricula',
  );
  @override
  late final GeneratedColumn<bool> matricula = GeneratedColumn<bool>(
    'matricula',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("matricula" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, idade, matricula];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alunos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Aluno> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('idade')) {
      context.handle(
        _idadeMeta,
        idade.isAcceptableOrUnknown(data['idade']!, _idadeMeta),
      );
    } else if (isInserting) {
      context.missing(_idadeMeta);
    }
    if (data.containsKey('matricula')) {
      context.handle(
        _matriculaMeta,
        matricula.isAcceptableOrUnknown(data['matricula']!, _matriculaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Aluno map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Aluno(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      idade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}idade'],
      )!,
      matricula: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}matricula'],
      )!,
    );
  }

  @override
  $AlunosTable createAlias(String alias) {
    return $AlunosTable(attachedDatabase, alias);
  }
}

class Aluno extends DataClass implements Insertable<Aluno> {
  final int id;
  final String nome;
  final int idade;
  final bool matricula;
  const Aluno({
    required this.id,
    required this.nome,
    required this.idade,
    required this.matricula,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['idade'] = Variable<int>(idade);
    map['matricula'] = Variable<bool>(matricula);
    return map;
  }

  AlunosCompanion toCompanion(bool nullToAbsent) {
    return AlunosCompanion(
      id: Value(id),
      nome: Value(nome),
      idade: Value(idade),
      matricula: Value(matricula),
    );
  }

  factory Aluno.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Aluno(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      idade: serializer.fromJson<int>(json['idade']),
      matricula: serializer.fromJson<bool>(json['matricula']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'idade': serializer.toJson<int>(idade),
      'matricula': serializer.toJson<bool>(matricula),
    };
  }

  Aluno copyWith({int? id, String? nome, int? idade, bool? matricula}) => Aluno(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    idade: idade ?? this.idade,
    matricula: matricula ?? this.matricula,
  );
  Aluno copyWithCompanion(AlunosCompanion data) {
    return Aluno(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      idade: data.idade.present ? data.idade.value : this.idade,
      matricula: data.matricula.present ? data.matricula.value : this.matricula,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Aluno(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('idade: $idade, ')
          ..write('matricula: $matricula')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, idade, matricula);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Aluno &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.idade == this.idade &&
          other.matricula == this.matricula);
}

class AlunosCompanion extends UpdateCompanion<Aluno> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> idade;
  final Value<bool> matricula;
  const AlunosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.idade = const Value.absent(),
    this.matricula = const Value.absent(),
  });
  AlunosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required int idade,
    this.matricula = const Value.absent(),
  }) : nome = Value(nome),
       idade = Value(idade);
  static Insertable<Aluno> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? idade,
    Expression<bool>? matricula,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (idade != null) 'idade': idade,
      if (matricula != null) 'matricula': matricula,
    });
  }

  AlunosCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<int>? idade,
    Value<bool>? matricula,
  }) {
    return AlunosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      matricula: matricula ?? this.matricula,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (idade.present) {
      map['idade'] = Variable<int>(idade.value);
    }
    if (matricula.present) {
      map['matricula'] = Variable<bool>(matricula.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlunosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('idade: $idade, ')
          ..write('matricula: $matricula')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlunosTable alunos = $AlunosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [alunos];
}

typedef $$AlunosTableCreateCompanionBuilder =
    AlunosCompanion Function({
      Value<int> id,
      required String nome,
      required int idade,
      Value<bool> matricula,
    });
typedef $$AlunosTableUpdateCompanionBuilder =
    AlunosCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<int> idade,
      Value<bool> matricula,
    });

class $$AlunosTableFilterComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get idade => $composableBuilder(
    column: $table.idade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlunosTableOrderingComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get idade => $composableBuilder(
    column: $table.idade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get matricula => $composableBuilder(
    column: $table.matricula,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlunosTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlunosTable> {
  $$AlunosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<int> get idade =>
      $composableBuilder(column: $table.idade, builder: (column) => column);

  GeneratedColumn<bool> get matricula =>
      $composableBuilder(column: $table.matricula, builder: (column) => column);
}

class $$AlunosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlunosTable,
          Aluno,
          $$AlunosTableFilterComposer,
          $$AlunosTableOrderingComposer,
          $$AlunosTableAnnotationComposer,
          $$AlunosTableCreateCompanionBuilder,
          $$AlunosTableUpdateCompanionBuilder,
          (Aluno, BaseReferences<_$AppDatabase, $AlunosTable, Aluno>),
          Aluno,
          PrefetchHooks Function()
        > {
  $$AlunosTableTableManager(_$AppDatabase db, $AlunosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlunosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlunosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlunosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<int> idade = const Value.absent(),
                Value<bool> matricula = const Value.absent(),
              }) => AlunosCompanion(
                id: id,
                nome: nome,
                idade: idade,
                matricula: matricula,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required int idade,
                Value<bool> matricula = const Value.absent(),
              }) => AlunosCompanion.insert(
                id: id,
                nome: nome,
                idade: idade,
                matricula: matricula,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlunosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlunosTable,
      Aluno,
      $$AlunosTableFilterComposer,
      $$AlunosTableOrderingComposer,
      $$AlunosTableAnnotationComposer,
      $$AlunosTableCreateCompanionBuilder,
      $$AlunosTableUpdateCompanionBuilder,
      (Aluno, BaseReferences<_$AppDatabase, $AlunosTable, Aluno>),
      Aluno,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db, _db.alunos);
}
