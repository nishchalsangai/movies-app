import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/usecase.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/search_entity.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';

class SearchMoviesUsecase extends UseCase<List<MovieModel>, SearchEntity> {
  final MoviesRepository _moviesRepository;

  SearchMoviesUsecase(
    this._moviesRepository,
  );

  @override
  Future<Either<List<MovieModel>, Failure>> call(SearchEntity params) async {
    return await _moviesRepository.searchMovieQuery(params);
  }
}
