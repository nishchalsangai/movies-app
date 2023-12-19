import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/end_points.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_response.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/services/network_service.dart';

abstract class MoviesRemoteDatasource {
  Future<Either<UpcomingMoviesResponse, Failure>> fetchUpComingMovies(
      {required int page});

  Future<Either<MovieDetailsResponse, Failure>> fetchMovieDetails(
      {required String movieId});


}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  @override
  Future<Either<UpcomingMoviesResponse, Failure>> fetchUpComingMovies(
      {required int page}) async {
    try {
      final response = await NetworkService.get(
          url:
              '${Constants.baseUrl}${EndPoints.ucoming}?api_key=${Constants.apiKey}&page=$page');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Left(upcomingMoviesResponseFromJson(response.body));
      } else {
        return Right(
            ServerFailure(exception: Exception(response.reasonPhrase)));
      }
    } on Exception catch (e) {
      return Right(ServerFailure(exception: Exception(e)));
    }
  }

  @override
  Future<Either<MovieDetailsResponse, Failure>> fetchMovieDetails(
      {required String movieId}) async {
    try {
      final response = await NetworkService.get(
          url:
              '${Constants.baseUrl}$movieId?api_key=${Constants.apiKey}&${EndPoints.appendToResponse}=${EndPoints.images},${EndPoints.videos}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Left(movieDetailsResponseFromJson(response.body));
      } else {
        return Right(
            ServerFailure(exception: Exception(response.reasonPhrase)));
      }
    } on Exception catch (e) {
      return Right(ServerFailure(exception: Exception(e)));
    }
  }
  
 
}
