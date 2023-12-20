import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/usecase.dart';
import 'package:movies_app/modules/movies/data/models/remote/movie_details_response.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';

class MovieDetailsUsecase extends UseCase<MovieDetailsResponse, String> {
  final MoviesRepository _moviesRepository;

  MovieDetailsUsecase(
    this._moviesRepository,
  );

  @override
  Future<Either<MovieDetailsResponse, Failure>> call(String params) async {
    return await _moviesRepository.getMovieDetails(params);
  }
}
