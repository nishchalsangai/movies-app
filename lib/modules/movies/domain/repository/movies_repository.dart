import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/movies/data/models/remote/movie_details_response.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/search_entity.dart';

abstract class MoviesRepository {
  Future<Either<List<MovieModel>, Failure>> getAllUpcomingMovies(int page);
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(String movieId);
  Future<Either<List<MovieModel>, Failure>> searchMovieQuery(SearchEntity searchEntity);
}
