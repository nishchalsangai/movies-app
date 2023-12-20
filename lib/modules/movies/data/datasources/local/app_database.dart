import 'dart:async';
import 'package:floor/floor.dart';
import 'package:movies_app/core/helpers/dao_helpers.dart';
import 'package:movies_app/modules/movies/data/datasources/local/DAO/movies_local_datasource.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@TypeConverters([IntListConverter,DateTimeConverter])
@Database(version: 1, entities: [MovieModel])
abstract class AppDatabase extends FloorDatabase {
  MoviesLocalDatasource get moviesDAO;
}