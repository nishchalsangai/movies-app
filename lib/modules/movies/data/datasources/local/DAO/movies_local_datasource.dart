import 'package:floor/floor.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';

@dao
abstract class MoviesLocalDatasource {
  @Query('SELECT * FROM movies')
  Future<List<MovieModel>> retrieveUpcomingMoviesList();

  @Query('SELECT id FROM movies')
  Future<List<int>> getAllMovieIds();


  @insert
  Future<void> saveUpcomingMoviesList(List<MovieModel> movies);
}


