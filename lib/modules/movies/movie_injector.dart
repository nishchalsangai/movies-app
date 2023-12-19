import 'package:movies_app/dependency_injection.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_local_datasource.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movies_respository_impl.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/managers/movie_details/movie_details_manager.dart';
import 'package:movies_app/modules/movies/presentation/managers/upcoming_movies/upcoming_movies_manager.dart';

Future<void> movieInjector() async {
  sl.registerLazySingleton<MoviesLocalDatasource>(
      () => MoviesLocalDatasourceImpl());
  sl.registerLazySingleton<MoviesRemoteDatasource>(
      () => MoviesRemoteDatasourceImpl());

  sl.registerLazySingleton<MovieDetailsUsecase>(
      () => MovieDetailsUsecase(sl()));
  sl.registerLazySingleton<UpcomingMoviesUsecase>(
      () => UpcomingMoviesUsecase(sl()));

  sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRespositoryImpl(sl(), sl()));

  sl.registerFactory<UpcomingMoviesManager>(() => UpcomingMoviesManager(sl()));
  sl.registerFactoryParam<MovieDetailsManager,String,String?>((movieId,_) => MovieDetailsManager(sl(),movieId));
}
