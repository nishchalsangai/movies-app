import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_local_datasource.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_response.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/search_entity.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';

class MoviesRespositoryImpl extends MoviesRepository {
  final MoviesRemoteDatasource moviesRemoteDatasource;
  final MoviesLocalDatasource moviesLocalDatasource;

  MoviesRespositoryImpl(
      this.moviesLocalDatasource, this.moviesRemoteDatasource);

  @override
  Future<Either<List<MovieModel>, Failure>> getAllUpcomingMovies(
      int page) async {
    final result = await moviesRemoteDatasource.fetchUpComingMovies(page: page);
    return result.fold((l) => Left(l.results), (r) => Right(r));
  }

  @override
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(
      String movieId) async {
    final result =
        await moviesRemoteDatasource.fetchMovieDetails(movieId: movieId);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<List<MovieModel>, Failure>> searchMovieQuery(
      SearchEntity searchEntity) async {
    final result = await moviesRemoteDatasource.fetchMoviesSearchResult(
        query: searchEntity.query, page: searchEntity.page);
    return result.fold((l) => Left(l.results ?? []), (r) => Right(r));
  }
}
