// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MoviesLocalDatasource? _moviesDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`adult` INTEGER NOT NULL, `backdropPath` TEXT, `genreIds` TEXT NOT NULL, `id` INTEGER NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `posterPath` TEXT NOT NULL, `releaseDate` INTEGER, `title` TEXT NOT NULL, `video` INTEGER NOT NULL, `voteAverage` REAL NOT NULL, `voteCount` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MoviesLocalDatasource get moviesDAO {
    return _moviesDAOInstance ??=
        _$MoviesLocalDatasource(database, changeListener);
  }
}

class _$MoviesLocalDatasource extends MoviesLocalDatasource {
  _$MoviesLocalDatasource(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieModelInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieModel item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'genreIds': _intListConverter.encode(item.genreIds),
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': _dateTimeConverter.encode(item.releaseDate),
                  'title': item.title,
                  'video': item.video ? 1 : 0,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieModel> _movieModelInsertionAdapter;

  @override
  Future<List<MovieModel>> retrieveUpcomingMoviesList() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => MovieModel(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String?,
            genreIds: _intListConverter.decode(row['genreIds'] as String),
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            posterPath: row['posterPath'] as String,
            releaseDate: _dateTimeConverter.decode(row['releaseDate'] as int?),
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int));
  }

  @override
  Future<List<int>> getAllMovieIds() async {
    return _queryAdapter.queryList('SELECT id FROM movies',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> saveUpcomingMoviesList(List<MovieModel> movies) async {
    await _movieModelInsertionAdapter.insertList(
        movies, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _intListConverter = IntListConverter();
final _dateTimeConverter = DateTimeConverter();
