// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DragonsTable extends Dragons with TableInfo<$DragonsTable, Dragon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DragonsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, height, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dragons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Dragon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dragon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dragon(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DragonsTable createAlias(String alias) {
    return $DragonsTable(attachedDatabase, alias);
  }
}

class Dragon extends DataClass implements Insertable<Dragon> {
  final int id;
  final String name;
  final int height;
  final DateTime createdAt;
  const Dragon({
    required this.id,
    required this.name,
    required this.height,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['height'] = Variable<int>(height);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DragonsCompanion toCompanion(bool nullToAbsent) {
    return DragonsCompanion(
      id: Value(id),
      name: Value(name),
      height: Value(height),
      createdAt: Value(createdAt),
    );
  }

  factory Dragon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dragon(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      height: serializer.fromJson<int>(json['height']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'height': serializer.toJson<int>(height),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Dragon copyWith({int? id, String? name, int? height, DateTime? createdAt}) =>
      Dragon(
        id: id ?? this.id,
        name: name ?? this.name,
        height: height ?? this.height,
        createdAt: createdAt ?? this.createdAt,
      );
  Dragon copyWithCompanion(DragonsCompanion data) {
    return Dragon(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      height: data.height.present ? data.height.value : this.height,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dragon(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, height, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dragon &&
          other.id == this.id &&
          other.name == this.name &&
          other.height == this.height &&
          other.createdAt == this.createdAt);
}

class DragonsCompanion extends UpdateCompanion<Dragon> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> height;
  final Value<DateTime> createdAt;
  const DragonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.height = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DragonsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int height,
    required DateTime createdAt,
  }) : name = Value(name),
       height = Value(height),
       createdAt = Value(createdAt);
  static Insertable<Dragon> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? height,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (height != null) 'height': height,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DragonsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? height,
    Value<DateTime>? createdAt,
  }) {
    return DragonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DragonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DragonsTable dragons = $DragonsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dragons];
}

typedef $$DragonsTableCreateCompanionBuilder =
    DragonsCompanion Function({
      Value<int> id,
      required String name,
      required int height,
      required DateTime createdAt,
    });
typedef $$DragonsTableUpdateCompanionBuilder =
    DragonsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> height,
      Value<DateTime> createdAt,
    });

class $$DragonsTableFilterComposer
    extends Composer<_$AppDatabase, $DragonsTable> {
  $$DragonsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DragonsTableOrderingComposer
    extends Composer<_$AppDatabase, $DragonsTable> {
  $$DragonsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DragonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DragonsTable> {
  $$DragonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DragonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DragonsTable,
          Dragon,
          $$DragonsTableFilterComposer,
          $$DragonsTableOrderingComposer,
          $$DragonsTableAnnotationComposer,
          $$DragonsTableCreateCompanionBuilder,
          $$DragonsTableUpdateCompanionBuilder,
          (Dragon, BaseReferences<_$AppDatabase, $DragonsTable, Dragon>),
          Dragon,
          PrefetchHooks Function()
        > {
  $$DragonsTableTableManager(_$AppDatabase db, $DragonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DragonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DragonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DragonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DragonsCompanion(
                id: id,
                name: name,
                height: height,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int height,
                required DateTime createdAt,
              }) => DragonsCompanion.insert(
                id: id,
                name: name,
                height: height,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DragonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DragonsTable,
      Dragon,
      $$DragonsTableFilterComposer,
      $$DragonsTableOrderingComposer,
      $$DragonsTableAnnotationComposer,
      $$DragonsTableCreateCompanionBuilder,
      $$DragonsTableUpdateCompanionBuilder,
      (Dragon, BaseReferences<_$AppDatabase, $DragonsTable, Dragon>),
      Dragon,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DragonsTableTableManager get dragons =>
      $$DragonsTableTableManager(_db, _db.dragons);
}
