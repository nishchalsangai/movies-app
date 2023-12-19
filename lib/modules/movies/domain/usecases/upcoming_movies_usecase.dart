import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/usecase.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';

class UpcomingMoviesUsecase extends UseCase<List<UpcomingMovieModel>, int> {
  final MoviesRepository _moviesRepository;

  UpcomingMoviesUsecase(
    this._moviesRepository,
  );

  @override
  Future<Either<List<UpcomingMovieModel>, Failure>> call(int params) async {
    return await _moviesRepository.getAllUpcomingMovies(params);
  }
}
