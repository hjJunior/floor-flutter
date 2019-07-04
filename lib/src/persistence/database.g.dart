// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao _personDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT)');
      },
    );
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener),
        _personUpdateAdapter = UpdateAdapter(
            database,
            'Person',
            'id',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            'id',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _personMapper = (Map<String, dynamic> row) =>
      Person(row['id'] as int, row['name'] as String);

  final InsertionAdapter<Person> _personInsertionAdapter;

  final UpdateAdapter<Person> _personUpdateAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<List<Person>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: _personMapper);
  }

  @override
  Stream<List<Person>> findAllPersonsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Person',
        tableName: 'Person', mapper: _personMapper);
  }

  @override
  Future<Person> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[id], mapper: _personMapper);
  }

  @override
  Future<void> insertPerson(Person person) async {
    await _personInsertionAdapter.insert(
        person, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updatePerson(Person person) {
    return _personUpdateAdapter.updateAndReturnChangedRows(
        person, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> removePerson(Person person) async {
    await _personDeletionAdapter.delete(person);
  }
}
