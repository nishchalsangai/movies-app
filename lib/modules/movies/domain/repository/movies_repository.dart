import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_response.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';

abstract class MoviesRepository {
  Future<Either<List<UpcomingMovieModel>, Failure>> getAllUpcomingMovies(
      int page);
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(String movieId);
}
