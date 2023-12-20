import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/movies/data/datasources/local/app_database.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/models/remote/movie_details_response.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/search_entity.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/services/internet_service.dart';

class MoviesRespositoryImpl extends MoviesRepository {
  final MoviesRemoteDatasource moviesRemoteDatasource;
  final InternetService internetService;
  final AppDatabase appDatabase;
  MoviesRespositoryImpl(
      this.moviesRemoteDatasource, this.internetService, this.appDatabase);

  @override
  Future<Either<List<MovieModel>, Failure>> getAllUpcomingMovies(
      int page) async {
    try {
      if (!await internetService.hasInternet()) {
        final localMovies =
            await appDatabase.moviesDAO.retrieveUpcomingMoviesList();
        if (localMovies.isNotEmpty) {
          return Left(localMovies);
        }
        return Right(ServerFailure(exception: Exception('No Internet')));
      }
      final result =
          await moviesRemoteDatasource.fetchUpComingMovies(page: page);

      return result.fold((l) async {
        await addMoviesIfNotExist(l.results);
        return Left(l.results);
      }, (r) => Right(r));
    } on Exception {
      return Right(
          ServerFailure(exception: Exception('Error Fetching movies')));
    }
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

  Future<void> addMoviesIfNotExist(List<MovieModel> moviesToInsert) async {
    // Retrieve all existing movie IDs
    final existingIds = await appDatabase.moviesDAO.getAllMovieIds();

    // Filter out movies that already exist
    final moviesToInsertFiltered = moviesToInsert
        .where((movie) => !existingIds.contains(movie.id))
        .toList();

    // Insert the filtered list
    if (moviesToInsertFiltered.isNotEmpty) {
      await appDatabase.moviesDAO
          .saveUpcomingMoviesList(moviesToInsertFiltered);
      log('New movies added.');
    } else {
      log('No new movies to add.');
    }
  }
}
