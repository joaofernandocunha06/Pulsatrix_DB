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
  static const VerificationMeta _demoMeta = const VerificationMeta('demo');
  @override
  late final GeneratedColumn<bool> demo = GeneratedColumn<bool>(
    'demo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("demo" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _necessidadeMeta = const VerificationMeta(
    'necessidade',
  );
  @override
  late final GeneratedColumn<bool> necessidade = GeneratedColumn<bool>(
    'necessidade',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("necessidade" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nome,
    idade,
    matricula,
    demo,
    necessidade,
    condition,
    data,
    numero,
  ];
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
    if (data.containsKey('demo')) {
      context.handle(
        _demoMeta,
        demo.isAcceptableOrUnknown(data['demo']!, _demoMeta),
      );
    }
    if (data.containsKey('necessidade')) {
      context.handle(
        _necessidadeMeta,
        necessidade.isAcceptableOrUnknown(
          data['necessidade']!,
          _necessidadeMeta,
        ),
      );
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
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
      demo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}demo'],
      )!,
      necessidade: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}necessidade'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      numero: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero'],
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
  final bool demo;
  final bool necessidade;
  final String condition;
  final String data;
  final String numero;
  const Aluno({
    required this.id,
    required this.nome,
    required this.idade,
    required this.matricula,
    required this.demo,
    required this.necessidade,
    required this.condition,
    required this.data,
    required this.numero,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['idade'] = Variable<int>(idade);
    map['matricula'] = Variable<bool>(matricula);
    map['demo'] = Variable<bool>(demo);
    map['necessidade'] = Variable<bool>(necessidade);
    map['condition'] = Variable<String>(condition);
    map['data'] = Variable<String>(data);
    map['numero'] = Variable<String>(numero);
    return map;
  }

  AlunosCompanion toCompanion(bool nullToAbsent) {
    return AlunosCompanion(
      id: Value(id),
      nome: Value(nome),
      idade: Value(idade),
      matricula: Value(matricula),
      demo: Value(demo),
      necessidade: Value(necessidade),
      condition: Value(condition),
      data: Value(data),
      numero: Value(numero),
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
      demo: serializer.fromJson<bool>(json['demo']),
      necessidade: serializer.fromJson<bool>(json['necessidade']),
      condition: serializer.fromJson<String>(json['condition']),
      data: serializer.fromJson<String>(json['data']),
      numero: serializer.fromJson<String>(json['numero']),
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
      'demo': serializer.toJson<bool>(demo),
      'necessidade': serializer.toJson<bool>(necessidade),
      'condition': serializer.toJson<String>(condition),
      'data': serializer.toJson<String>(data),
      'numero': serializer.toJson<String>(numero),
    };
  }

  Aluno copyWith({
    int? id,
    String? nome,
    int? idade,
    bool? matricula,
    bool? demo,
    bool? necessidade,
    String? condition,
    String? data,
    String? numero,
  }) => Aluno(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    idade: idade ?? this.idade,
    matricula: matricula ?? this.matricula,
    demo: demo ?? this.demo,
    necessidade: necessidade ?? this.necessidade,
    condition: condition ?? this.condition,
    data: data ?? this.data,
    numero: numero ?? this.numero,
  );
  Aluno copyWithCompanion(AlunosCompanion data) {
    return Aluno(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      idade: data.idade.present ? data.idade.value : this.idade,
      matricula: data.matricula.present ? data.matricula.value : this.matricula,
      demo: data.demo.present ? data.demo.value : this.demo,
      necessidade: data.necessidade.present
          ? data.necessidade.value
          : this.necessidade,
      condition: data.condition.present ? data.condition.value : this.condition,
      data: data.data.present ? data.data.value : this.data,
      numero: data.numero.present ? data.numero.value : this.numero,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Aluno(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('idade: $idade, ')
          ..write('matricula: $matricula, ')
          ..write('demo: $demo, ')
          ..write('necessidade: $necessidade, ')
          ..write('condition: $condition, ')
          ..write('data: $data, ')
          ..write('numero: $numero')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nome,
    idade,
    matricula,
    demo,
    necessidade,
    condition,
    data,
    numero,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Aluno &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.idade == this.idade &&
          other.matricula == this.matricula &&
          other.demo == this.demo &&
          other.necessidade == this.necessidade &&
          other.condition == this.condition &&
          other.data == this.data &&
          other.numero == this.numero);
}

class AlunosCompanion extends UpdateCompanion<Aluno> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> idade;
  final Value<bool> matricula;
  final Value<bool> demo;
  final Value<bool> necessidade;
  final Value<String> condition;
  final Value<String> data;
  final Value<String> numero;
  const AlunosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.idade = const Value.absent(),
    this.matricula = const Value.absent(),
    this.demo = const Value.absent(),
    this.necessidade = const Value.absent(),
    this.condition = const Value.absent(),
    this.data = const Value.absent(),
    this.numero = const Value.absent(),
  });
  AlunosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required int idade,
    this.matricula = const Value.absent(),
    this.demo = const Value.absent(),
    this.necessidade = const Value.absent(),
    required String condition,
    required String data,
    required String numero,
  }) : nome = Value(nome),
       idade = Value(idade),
       condition = Value(condition),
       data = Value(data),
       numero = Value(numero);
  static Insertable<Aluno> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? idade,
    Expression<bool>? matricula,
    Expression<bool>? demo,
    Expression<bool>? necessidade,
    Expression<String>? condition,
    Expression<String>? data,
    Expression<String>? numero,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (idade != null) 'idade': idade,
      if (matricula != null) 'matricula': matricula,
      if (demo != null) 'demo': demo,
      if (necessidade != null) 'necessidade': necessidade,
      if (condition != null) 'condition': condition,
      if (data != null) 'data': data,
      if (numero != null) 'numero': numero,
    });
  }

  AlunosCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<int>? idade,
    Value<bool>? matricula,
    Value<bool>? demo,
    Value<bool>? necessidade,
    Value<String>? condition,
    Value<String>? data,
    Value<String>? numero,
  }) {
    return AlunosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      matricula: matricula ?? this.matricula,
      demo: demo ?? this.demo,
      necessidade: necessidade ?? this.necessidade,
      condition: condition ?? this.condition,
      data: data ?? this.data,
      numero: numero ?? this.numero,
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
    if (demo.present) {
      map['demo'] = Variable<bool>(demo.value);
    }
    if (necessidade.present) {
      map['necessidade'] = Variable<bool>(necessidade.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlunosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('idade: $idade, ')
          ..write('matricula: $matricula, ')
          ..write('demo: $demo, ')
          ..write('necessidade: $necessidade, ')
          ..write('condition: $condition, ')
          ..write('data: $data, ')
          ..write('numero: $numero')
          ..write(')'))
        .toString();
  }
}

class $AlunosDetalhesTable extends AlunosDetalhes
    with TableInfo<$AlunosDetalhesTable, AlunosDetalhe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlunosDetalhesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _alunoIDMeta = const VerificationMeta(
    'alunoID',
  );
  @override
  late final GeneratedColumn<int> alunoID = GeneratedColumn<int>(
    'aluno_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alunos (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 60),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<String> cpf = GeneratedColumn<String>(
    'cpf',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 14),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rgMeta = const VerificationMeta('rg');
  @override
  late final GeneratedColumn<String> rg = GeneratedColumn<String>(
    'rg',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 12),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nacionalidadeMeta = const VerificationMeta(
    'nacionalidade',
  );
  @override
  late final GeneratedColumn<String> nacionalidade = GeneratedColumn<String>(
    'nacionalidade',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1000),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameRespMeta = const VerificationMeta(
    'nameResp',
  );
  @override
  late final GeneratedColumn<String> nameResp = GeneratedColumn<String>(
    'name_resp',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 35),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberRespMeta = const VerificationMeta(
    'numberResp',
  );
  @override
  late final GeneratedColumn<String> numberResp = GeneratedColumn<String>(
    'number_resp',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 12),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cpfRespMeta = const VerificationMeta(
    'cpfResp',
  );
  @override
  late final GeneratedColumn<String> cpfResp = GeneratedColumn<String>(
    'cpf_resp',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 14),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rgRespMeta = const VerificationMeta('rgResp');
  @override
  late final GeneratedColumn<String> rgResp = GeneratedColumn<String>(
    'rg_resp',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 12),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estagioMeta = const VerificationMeta(
    'estagio',
  );
  @override
  late final GeneratedColumn<String> estagio = GeneratedColumn<String>(
    'estagio',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inicioMeta = const VerificationMeta('inicio');
  @override
  late final GeneratedColumn<String> inicio = GeneratedColumn<String>(
    'inicio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
    'notas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    alunoID,
    address,
    cpf,
    rg,
    nacionalidade,
    description,
    nameResp,
    numberResp,
    cpfResp,
    rgResp,
    material,
    estagio,
    inicio,
    notas,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alunos_detalhes';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlunosDetalhe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('aluno_i_d')) {
      context.handle(
        _alunoIDMeta,
        alunoID.isAcceptableOrUnknown(data['aluno_i_d']!, _alunoIDMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('cpf')) {
      context.handle(
        _cpfMeta,
        cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta),
      );
    } else if (isInserting) {
      context.missing(_cpfMeta);
    }
    if (data.containsKey('rg')) {
      context.handle(_rgMeta, rg.isAcceptableOrUnknown(data['rg']!, _rgMeta));
    } else if (isInserting) {
      context.missing(_rgMeta);
    }
    if (data.containsKey('nacionalidade')) {
      context.handle(
        _nacionalidadeMeta,
        nacionalidade.isAcceptableOrUnknown(
          data['nacionalidade']!,
          _nacionalidadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nacionalidadeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('name_resp')) {
      context.handle(
        _nameRespMeta,
        nameResp.isAcceptableOrUnknown(data['name_resp']!, _nameRespMeta),
      );
    } else if (isInserting) {
      context.missing(_nameRespMeta);
    }
    if (data.containsKey('number_resp')) {
      context.handle(
        _numberRespMeta,
        numberResp.isAcceptableOrUnknown(data['number_resp']!, _numberRespMeta),
      );
    } else if (isInserting) {
      context.missing(_numberRespMeta);
    }
    if (data.containsKey('cpf_resp')) {
      context.handle(
        _cpfRespMeta,
        cpfResp.isAcceptableOrUnknown(data['cpf_resp']!, _cpfRespMeta),
      );
    } else if (isInserting) {
      context.missing(_cpfRespMeta);
    }
    if (data.containsKey('rg_resp')) {
      context.handle(
        _rgRespMeta,
        rgResp.isAcceptableOrUnknown(data['rg_resp']!, _rgRespMeta),
      );
    } else if (isInserting) {
      context.missing(_rgRespMeta);
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    } else if (isInserting) {
      context.missing(_materialMeta);
    }
    if (data.containsKey('estagio')) {
      context.handle(
        _estagioMeta,
        estagio.isAcceptableOrUnknown(data['estagio']!, _estagioMeta),
      );
    } else if (isInserting) {
      context.missing(_estagioMeta);
    }
    if (data.containsKey('inicio')) {
      context.handle(
        _inicioMeta,
        inicio.isAcceptableOrUnknown(data['inicio']!, _inicioMeta),
      );
    }
    if (data.containsKey('notas')) {
      context.handle(
        _notasMeta,
        notas.isAcceptableOrUnknown(data['notas']!, _notasMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {alunoID};
  @override
  AlunosDetalhe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlunosDetalhe(
      alunoID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aluno_i_d'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      cpf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cpf'],
      )!,
      rg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rg'],
      )!,
      nacionalidade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nacionalidade'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      nameResp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_resp'],
      )!,
      numberResp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number_resp'],
      )!,
      cpfResp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cpf_resp'],
      )!,
      rgResp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rg_resp'],
      )!,
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      )!,
      estagio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estagio'],
      )!,
      inicio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inicio'],
      ),
      notas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notas'],
      ),
    );
  }

  @override
  $AlunosDetalhesTable createAlias(String alias) {
    return $AlunosDetalhesTable(attachedDatabase, alias);
  }
}

class AlunosDetalhe extends DataClass implements Insertable<AlunosDetalhe> {
  final int alunoID;
  final String address;
  final String cpf;
  final String rg;
  final String nacionalidade;
  final String description;
  final String nameResp;
  final String numberResp;
  final String cpfResp;
  final String rgResp;
  final String material;
  final String estagio;
  final String? inicio;
  final String? notas;
  const AlunosDetalhe({
    required this.alunoID,
    required this.address,
    required this.cpf,
    required this.rg,
    required this.nacionalidade,
    required this.description,
    required this.nameResp,
    required this.numberResp,
    required this.cpfResp,
    required this.rgResp,
    required this.material,
    required this.estagio,
    this.inicio,
    this.notas,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['aluno_i_d'] = Variable<int>(alunoID);
    map['address'] = Variable<String>(address);
    map['cpf'] = Variable<String>(cpf);
    map['rg'] = Variable<String>(rg);
    map['nacionalidade'] = Variable<String>(nacionalidade);
    map['description'] = Variable<String>(description);
    map['name_resp'] = Variable<String>(nameResp);
    map['number_resp'] = Variable<String>(numberResp);
    map['cpf_resp'] = Variable<String>(cpfResp);
    map['rg_resp'] = Variable<String>(rgResp);
    map['material'] = Variable<String>(material);
    map['estagio'] = Variable<String>(estagio);
    if (!nullToAbsent || inicio != null) {
      map['inicio'] = Variable<String>(inicio);
    }
    if (!nullToAbsent || notas != null) {
      map['notas'] = Variable<String>(notas);
    }
    return map;
  }

  AlunosDetalhesCompanion toCompanion(bool nullToAbsent) {
    return AlunosDetalhesCompanion(
      alunoID: Value(alunoID),
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
      inicio: inicio == null && nullToAbsent
          ? const Value.absent()
          : Value(inicio),
      notas: notas == null && nullToAbsent
          ? const Value.absent()
          : Value(notas),
    );
  }

  factory AlunosDetalhe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlunosDetalhe(
      alunoID: serializer.fromJson<int>(json['alunoID']),
      address: serializer.fromJson<String>(json['address']),
      cpf: serializer.fromJson<String>(json['cpf']),
      rg: serializer.fromJson<String>(json['rg']),
      nacionalidade: serializer.fromJson<String>(json['nacionalidade']),
      description: serializer.fromJson<String>(json['description']),
      nameResp: serializer.fromJson<String>(json['nameResp']),
      numberResp: serializer.fromJson<String>(json['numberResp']),
      cpfResp: serializer.fromJson<String>(json['cpfResp']),
      rgResp: serializer.fromJson<String>(json['rgResp']),
      material: serializer.fromJson<String>(json['material']),
      estagio: serializer.fromJson<String>(json['estagio']),
      inicio: serializer.fromJson<String?>(json['inicio']),
      notas: serializer.fromJson<String?>(json['notas']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'alunoID': serializer.toJson<int>(alunoID),
      'address': serializer.toJson<String>(address),
      'cpf': serializer.toJson<String>(cpf),
      'rg': serializer.toJson<String>(rg),
      'nacionalidade': serializer.toJson<String>(nacionalidade),
      'description': serializer.toJson<String>(description),
      'nameResp': serializer.toJson<String>(nameResp),
      'numberResp': serializer.toJson<String>(numberResp),
      'cpfResp': serializer.toJson<String>(cpfResp),
      'rgResp': serializer.toJson<String>(rgResp),
      'material': serializer.toJson<String>(material),
      'estagio': serializer.toJson<String>(estagio),
      'inicio': serializer.toJson<String?>(inicio),
      'notas': serializer.toJson<String?>(notas),
    };
  }

  AlunosDetalhe copyWith({
    int? alunoID,
    String? address,
    String? cpf,
    String? rg,
    String? nacionalidade,
    String? description,
    String? nameResp,
    String? numberResp,
    String? cpfResp,
    String? rgResp,
    String? material,
    String? estagio,
    Value<String?> inicio = const Value.absent(),
    Value<String?> notas = const Value.absent(),
  }) => AlunosDetalhe(
    alunoID: alunoID ?? this.alunoID,
    address: address ?? this.address,
    cpf: cpf ?? this.cpf,
    rg: rg ?? this.rg,
    nacionalidade: nacionalidade ?? this.nacionalidade,
    description: description ?? this.description,
    nameResp: nameResp ?? this.nameResp,
    numberResp: numberResp ?? this.numberResp,
    cpfResp: cpfResp ?? this.cpfResp,
    rgResp: rgResp ?? this.rgResp,
    material: material ?? this.material,
    estagio: estagio ?? this.estagio,
    inicio: inicio.present ? inicio.value : this.inicio,
    notas: notas.present ? notas.value : this.notas,
  );
  AlunosDetalhe copyWithCompanion(AlunosDetalhesCompanion data) {
    return AlunosDetalhe(
      alunoID: data.alunoID.present ? data.alunoID.value : this.alunoID,
      address: data.address.present ? data.address.value : this.address,
      cpf: data.cpf.present ? data.cpf.value : this.cpf,
      rg: data.rg.present ? data.rg.value : this.rg,
      nacionalidade: data.nacionalidade.present
          ? data.nacionalidade.value
          : this.nacionalidade,
      description: data.description.present
          ? data.description.value
          : this.description,
      nameResp: data.nameResp.present ? data.nameResp.value : this.nameResp,
      numberResp: data.numberResp.present
          ? data.numberResp.value
          : this.numberResp,
      cpfResp: data.cpfResp.present ? data.cpfResp.value : this.cpfResp,
      rgResp: data.rgResp.present ? data.rgResp.value : this.rgResp,
      material: data.material.present ? data.material.value : this.material,
      estagio: data.estagio.present ? data.estagio.value : this.estagio,
      inicio: data.inicio.present ? data.inicio.value : this.inicio,
      notas: data.notas.present ? data.notas.value : this.notas,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlunosDetalhe(')
          ..write('alunoID: $alunoID, ')
          ..write('address: $address, ')
          ..write('cpf: $cpf, ')
          ..write('rg: $rg, ')
          ..write('nacionalidade: $nacionalidade, ')
          ..write('description: $description, ')
          ..write('nameResp: $nameResp, ')
          ..write('numberResp: $numberResp, ')
          ..write('cpfResp: $cpfResp, ')
          ..write('rgResp: $rgResp, ')
          ..write('material: $material, ')
          ..write('estagio: $estagio, ')
          ..write('inicio: $inicio, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    alunoID,
    address,
    cpf,
    rg,
    nacionalidade,
    description,
    nameResp,
    numberResp,
    cpfResp,
    rgResp,
    material,
    estagio,
    inicio,
    notas,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlunosDetalhe &&
          other.alunoID == this.alunoID &&
          other.address == this.address &&
          other.cpf == this.cpf &&
          other.rg == this.rg &&
          other.nacionalidade == this.nacionalidade &&
          other.description == this.description &&
          other.nameResp == this.nameResp &&
          other.numberResp == this.numberResp &&
          other.cpfResp == this.cpfResp &&
          other.rgResp == this.rgResp &&
          other.material == this.material &&
          other.estagio == this.estagio &&
          other.inicio == this.inicio &&
          other.notas == this.notas);
}

class AlunosDetalhesCompanion extends UpdateCompanion<AlunosDetalhe> {
  final Value<int> alunoID;
  final Value<String> address;
  final Value<String> cpf;
  final Value<String> rg;
  final Value<String> nacionalidade;
  final Value<String> description;
  final Value<String> nameResp;
  final Value<String> numberResp;
  final Value<String> cpfResp;
  final Value<String> rgResp;
  final Value<String> material;
  final Value<String> estagio;
  final Value<String?> inicio;
  final Value<String?> notas;
  const AlunosDetalhesCompanion({
    this.alunoID = const Value.absent(),
    this.address = const Value.absent(),
    this.cpf = const Value.absent(),
    this.rg = const Value.absent(),
    this.nacionalidade = const Value.absent(),
    this.description = const Value.absent(),
    this.nameResp = const Value.absent(),
    this.numberResp = const Value.absent(),
    this.cpfResp = const Value.absent(),
    this.rgResp = const Value.absent(),
    this.material = const Value.absent(),
    this.estagio = const Value.absent(),
    this.inicio = const Value.absent(),
    this.notas = const Value.absent(),
  });
  AlunosDetalhesCompanion.insert({
    this.alunoID = const Value.absent(),
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
    this.inicio = const Value.absent(),
    this.notas = const Value.absent(),
  }) : address = Value(address),
       cpf = Value(cpf),
       rg = Value(rg),
       nacionalidade = Value(nacionalidade),
       description = Value(description),
       nameResp = Value(nameResp),
       numberResp = Value(numberResp),
       cpfResp = Value(cpfResp),
       rgResp = Value(rgResp),
       material = Value(material),
       estagio = Value(estagio);
  static Insertable<AlunosDetalhe> custom({
    Expression<int>? alunoID,
    Expression<String>? address,
    Expression<String>? cpf,
    Expression<String>? rg,
    Expression<String>? nacionalidade,
    Expression<String>? description,
    Expression<String>? nameResp,
    Expression<String>? numberResp,
    Expression<String>? cpfResp,
    Expression<String>? rgResp,
    Expression<String>? material,
    Expression<String>? estagio,
    Expression<String>? inicio,
    Expression<String>? notas,
  }) {
    return RawValuesInsertable({
      if (alunoID != null) 'aluno_i_d': alunoID,
      if (address != null) 'address': address,
      if (cpf != null) 'cpf': cpf,
      if (rg != null) 'rg': rg,
      if (nacionalidade != null) 'nacionalidade': nacionalidade,
      if (description != null) 'description': description,
      if (nameResp != null) 'name_resp': nameResp,
      if (numberResp != null) 'number_resp': numberResp,
      if (cpfResp != null) 'cpf_resp': cpfResp,
      if (rgResp != null) 'rg_resp': rgResp,
      if (material != null) 'material': material,
      if (estagio != null) 'estagio': estagio,
      if (inicio != null) 'inicio': inicio,
      if (notas != null) 'notas': notas,
    });
  }

  AlunosDetalhesCompanion copyWith({
    Value<int>? alunoID,
    Value<String>? address,
    Value<String>? cpf,
    Value<String>? rg,
    Value<String>? nacionalidade,
    Value<String>? description,
    Value<String>? nameResp,
    Value<String>? numberResp,
    Value<String>? cpfResp,
    Value<String>? rgResp,
    Value<String>? material,
    Value<String>? estagio,
    Value<String?>? inicio,
    Value<String?>? notas,
  }) {
    return AlunosDetalhesCompanion(
      alunoID: alunoID ?? this.alunoID,
      address: address ?? this.address,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      nacionalidade: nacionalidade ?? this.nacionalidade,
      description: description ?? this.description,
      nameResp: nameResp ?? this.nameResp,
      numberResp: numberResp ?? this.numberResp,
      cpfResp: cpfResp ?? this.cpfResp,
      rgResp: rgResp ?? this.rgResp,
      material: material ?? this.material,
      estagio: estagio ?? this.estagio,
      inicio: inicio ?? this.inicio,
      notas: notas ?? this.notas,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (alunoID.present) {
      map['aluno_i_d'] = Variable<int>(alunoID.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<String>(cpf.value);
    }
    if (rg.present) {
      map['rg'] = Variable<String>(rg.value);
    }
    if (nacionalidade.present) {
      map['nacionalidade'] = Variable<String>(nacionalidade.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (nameResp.present) {
      map['name_resp'] = Variable<String>(nameResp.value);
    }
    if (numberResp.present) {
      map['number_resp'] = Variable<String>(numberResp.value);
    }
    if (cpfResp.present) {
      map['cpf_resp'] = Variable<String>(cpfResp.value);
    }
    if (rgResp.present) {
      map['rg_resp'] = Variable<String>(rgResp.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (estagio.present) {
      map['estagio'] = Variable<String>(estagio.value);
    }
    if (inicio.present) {
      map['inicio'] = Variable<String>(inicio.value);
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlunosDetalhesCompanion(')
          ..write('alunoID: $alunoID, ')
          ..write('address: $address, ')
          ..write('cpf: $cpf, ')
          ..write('rg: $rg, ')
          ..write('nacionalidade: $nacionalidade, ')
          ..write('description: $description, ')
          ..write('nameResp: $nameResp, ')
          ..write('numberResp: $numberResp, ')
          ..write('cpfResp: $cpfResp, ')
          ..write('rgResp: $rgResp, ')
          ..write('material: $material, ')
          ..write('estagio: $estagio, ')
          ..write('inicio: $inicio, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlunosTable alunos = $AlunosTable(this);
  late final $AlunosDetalhesTable alunosDetalhes = $AlunosDetalhesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [alunos, alunosDetalhes];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'alunos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('alunos_detalhes', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AlunosTableCreateCompanionBuilder =
    AlunosCompanion Function({
      Value<int> id,
      required String nome,
      required int idade,
      Value<bool> matricula,
      Value<bool> demo,
      Value<bool> necessidade,
      required String condition,
      required String data,
      required String numero,
    });
typedef $$AlunosTableUpdateCompanionBuilder =
    AlunosCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<int> idade,
      Value<bool> matricula,
      Value<bool> demo,
      Value<bool> necessidade,
      Value<String> condition,
      Value<String> data,
      Value<String> numero,
    });

final class $$AlunosTableReferences
    extends BaseReferences<_$AppDatabase, $AlunosTable, Aluno> {
  $$AlunosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AlunosDetalhesTable, List<AlunosDetalhe>>
  _alunosDetalhesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alunosDetalhes,
    aliasName: $_aliasNameGenerator(db.alunos.id, db.alunosDetalhes.alunoID),
  );

  $$AlunosDetalhesTableProcessedTableManager get alunosDetalhesRefs {
    final manager = $$AlunosDetalhesTableTableManager(
      $_db,
      $_db.alunosDetalhes,
    ).filter((f) => f.alunoID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alunosDetalhesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<bool> get demo => $composableBuilder(
    column: $table.demo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get necessidade => $composableBuilder(
    column: $table.necessidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> alunosDetalhesRefs(
    Expression<bool> Function($$AlunosDetalhesTableFilterComposer f) f,
  ) {
    final $$AlunosDetalhesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alunosDetalhes,
      getReferencedColumn: (t) => t.alunoID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosDetalhesTableFilterComposer(
            $db: $db,
            $table: $db.alunosDetalhes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<bool> get demo => $composableBuilder(
    column: $table.demo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get necessidade => $composableBuilder(
    column: $table.necessidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
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

  GeneratedColumn<bool> get demo =>
      $composableBuilder(column: $table.demo, builder: (column) => column);

  GeneratedColumn<bool> get necessidade => $composableBuilder(
    column: $table.necessidade,
    builder: (column) => column,
  );

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  Expression<T> alunosDetalhesRefs<T extends Object>(
    Expression<T> Function($$AlunosDetalhesTableAnnotationComposer a) f,
  ) {
    final $$AlunosDetalhesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alunosDetalhes,
      getReferencedColumn: (t) => t.alunoID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosDetalhesTableAnnotationComposer(
            $db: $db,
            $table: $db.alunosDetalhes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Aluno, $$AlunosTableReferences),
          Aluno,
          PrefetchHooks Function({bool alunosDetalhesRefs})
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
                Value<bool> demo = const Value.absent(),
                Value<bool> necessidade = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> numero = const Value.absent(),
              }) => AlunosCompanion(
                id: id,
                nome: nome,
                idade: idade,
                matricula: matricula,
                demo: demo,
                necessidade: necessidade,
                condition: condition,
                data: data,
                numero: numero,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required int idade,
                Value<bool> matricula = const Value.absent(),
                Value<bool> demo = const Value.absent(),
                Value<bool> necessidade = const Value.absent(),
                required String condition,
                required String data,
                required String numero,
              }) => AlunosCompanion.insert(
                id: id,
                nome: nome,
                idade: idade,
                matricula: matricula,
                demo: demo,
                necessidade: necessidade,
                condition: condition,
                data: data,
                numero: numero,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AlunosTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({alunosDetalhesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (alunosDetalhesRefs) db.alunosDetalhes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (alunosDetalhesRefs)
                    await $_getPrefetchedData<
                      Aluno,
                      $AlunosTable,
                      AlunosDetalhe
                    >(
                      currentTable: table,
                      referencedTable: $$AlunosTableReferences
                          ._alunosDetalhesRefsTable(db),
                      managerFromTypedResult: (p0) => $$AlunosTableReferences(
                        db,
                        table,
                        p0,
                      ).alunosDetalhesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.alunoID == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (Aluno, $$AlunosTableReferences),
      Aluno,
      PrefetchHooks Function({bool alunosDetalhesRefs})
    >;
typedef $$AlunosDetalhesTableCreateCompanionBuilder =
    AlunosDetalhesCompanion Function({
      Value<int> alunoID,
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
      Value<String?> inicio,
      Value<String?> notas,
    });
typedef $$AlunosDetalhesTableUpdateCompanionBuilder =
    AlunosDetalhesCompanion Function({
      Value<int> alunoID,
      Value<String> address,
      Value<String> cpf,
      Value<String> rg,
      Value<String> nacionalidade,
      Value<String> description,
      Value<String> nameResp,
      Value<String> numberResp,
      Value<String> cpfResp,
      Value<String> rgResp,
      Value<String> material,
      Value<String> estagio,
      Value<String?> inicio,
      Value<String?> notas,
    });

final class $$AlunosDetalhesTableReferences
    extends BaseReferences<_$AppDatabase, $AlunosDetalhesTable, AlunosDetalhe> {
  $$AlunosDetalhesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AlunosTable _alunoIDTable(_$AppDatabase db) => db.alunos.createAlias(
    $_aliasNameGenerator(db.alunosDetalhes.alunoID, db.alunos.id),
  );

  $$AlunosTableProcessedTableManager get alunoID {
    final $_column = $_itemColumn<int>('aluno_i_d')!;

    final manager = $$AlunosTableTableManager(
      $_db,
      $_db.alunos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_alunoIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlunosDetalhesTableFilterComposer
    extends Composer<_$AppDatabase, $AlunosDetalhesTable> {
  $$AlunosDetalhesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rg => $composableBuilder(
    column: $table.rg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nacionalidade => $composableBuilder(
    column: $table.nacionalidade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameResp => $composableBuilder(
    column: $table.nameResp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numberResp => $composableBuilder(
    column: $table.numberResp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cpfResp => $composableBuilder(
    column: $table.cpfResp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rgResp => $composableBuilder(
    column: $table.rgResp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estagio => $composableBuilder(
    column: $table.estagio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inicio => $composableBuilder(
    column: $table.inicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnFilters(column),
  );

  $$AlunosTableFilterComposer get alunoID {
    final $$AlunosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoID,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableFilterComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlunosDetalhesTableOrderingComposer
    extends Composer<_$AppDatabase, $AlunosDetalhesTable> {
  $$AlunosDetalhesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cpf => $composableBuilder(
    column: $table.cpf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rg => $composableBuilder(
    column: $table.rg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nacionalidade => $composableBuilder(
    column: $table.nacionalidade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameResp => $composableBuilder(
    column: $table.nameResp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numberResp => $composableBuilder(
    column: $table.numberResp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cpfResp => $composableBuilder(
    column: $table.cpfResp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rgResp => $composableBuilder(
    column: $table.rgResp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estagio => $composableBuilder(
    column: $table.estagio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inicio => $composableBuilder(
    column: $table.inicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnOrderings(column),
  );

  $$AlunosTableOrderingComposer get alunoID {
    final $$AlunosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoID,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableOrderingComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlunosDetalhesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlunosDetalhesTable> {
  $$AlunosDetalhesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get cpf =>
      $composableBuilder(column: $table.cpf, builder: (column) => column);

  GeneratedColumn<String> get rg =>
      $composableBuilder(column: $table.rg, builder: (column) => column);

  GeneratedColumn<String> get nacionalidade => $composableBuilder(
    column: $table.nacionalidade,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameResp =>
      $composableBuilder(column: $table.nameResp, builder: (column) => column);

  GeneratedColumn<String> get numberResp => $composableBuilder(
    column: $table.numberResp,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cpfResp =>
      $composableBuilder(column: $table.cpfResp, builder: (column) => column);

  GeneratedColumn<String> get rgResp =>
      $composableBuilder(column: $table.rgResp, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<String> get estagio =>
      $composableBuilder(column: $table.estagio, builder: (column) => column);

  GeneratedColumn<String> get inicio =>
      $composableBuilder(column: $table.inicio, builder: (column) => column);

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  $$AlunosTableAnnotationComposer get alunoID {
    final $$AlunosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alunoID,
      referencedTable: $db.alunos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlunosTableAnnotationComposer(
            $db: $db,
            $table: $db.alunos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlunosDetalhesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlunosDetalhesTable,
          AlunosDetalhe,
          $$AlunosDetalhesTableFilterComposer,
          $$AlunosDetalhesTableOrderingComposer,
          $$AlunosDetalhesTableAnnotationComposer,
          $$AlunosDetalhesTableCreateCompanionBuilder,
          $$AlunosDetalhesTableUpdateCompanionBuilder,
          (AlunosDetalhe, $$AlunosDetalhesTableReferences),
          AlunosDetalhe,
          PrefetchHooks Function({bool alunoID})
        > {
  $$AlunosDetalhesTableTableManager(
    _$AppDatabase db,
    $AlunosDetalhesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlunosDetalhesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlunosDetalhesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlunosDetalhesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> alunoID = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> cpf = const Value.absent(),
                Value<String> rg = const Value.absent(),
                Value<String> nacionalidade = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> nameResp = const Value.absent(),
                Value<String> numberResp = const Value.absent(),
                Value<String> cpfResp = const Value.absent(),
                Value<String> rgResp = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<String> estagio = const Value.absent(),
                Value<String?> inicio = const Value.absent(),
                Value<String?> notas = const Value.absent(),
              }) => AlunosDetalhesCompanion(
                alunoID: alunoID,
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
                inicio: inicio,
                notas: notas,
              ),
          createCompanionCallback:
              ({
                Value<int> alunoID = const Value.absent(),
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
                Value<String?> inicio = const Value.absent(),
                Value<String?> notas = const Value.absent(),
              }) => AlunosDetalhesCompanion.insert(
                alunoID: alunoID,
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
                inicio: inicio,
                notas: notas,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AlunosDetalhesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({alunoID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (alunoID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.alunoID,
                                referencedTable: $$AlunosDetalhesTableReferences
                                    ._alunoIDTable(db),
                                referencedColumn:
                                    $$AlunosDetalhesTableReferences
                                        ._alunoIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AlunosDetalhesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlunosDetalhesTable,
      AlunosDetalhe,
      $$AlunosDetalhesTableFilterComposer,
      $$AlunosDetalhesTableOrderingComposer,
      $$AlunosDetalhesTableAnnotationComposer,
      $$AlunosDetalhesTableCreateCompanionBuilder,
      $$AlunosDetalhesTableUpdateCompanionBuilder,
      (AlunosDetalhe, $$AlunosDetalhesTableReferences),
      AlunosDetalhe,
      PrefetchHooks Function({bool alunoID})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlunosTableTableManager get alunos =>
      $$AlunosTableTableManager(_db, _db.alunos);
  $$AlunosDetalhesTableTableManager get alunosDetalhes =>
      $$AlunosDetalhesTableTableManager(_db, _db.alunosDetalhes);
}
