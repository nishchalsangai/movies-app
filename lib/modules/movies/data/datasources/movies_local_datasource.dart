import 'package:dartz/dartz.dart';

abstract class MoviesLocalDatasource {
  Future<Either<String, String>> fetchUpComingMovies();
}


class MoviesLocalDatasourceImpl implements MoviesLocalDatasource {
  @override
  Future<Either<String, String>> fetchUpComingMovies() {
    // TODO: implement fetchUpComingMovies
    throw UnimplementedError();
  }
}
