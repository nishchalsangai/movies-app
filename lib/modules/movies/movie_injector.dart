import 'package:movies_app/dependency_injection.dart';
import 'package:movies_app/modules/movies/data/datasources/local/DAO/movies_local_datasource.dart';
import 'package:movies_app/modules/movies/data/datasources/local/app_database.dart';
import 'package:movies_app/modules/movies/data/datasources/movies_remote_datasource.dart';
import 'package:movies_app/modules/movies/data/repository/movies_respository_impl.dart';
import 'package:movies_app/modules/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/modules/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/search_movie_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:movies_app/modules/movies/presentation/managers/movie_details/movie_details_manager.dart';
import 'package:movies_app/modules/movies/presentation/managers/search_movie/search_movie_manager.dart';
import 'package:movies_app/modules/movies/presentation/managers/upcoming_movies/upcoming_movies_manager.dart';

Future<void> movieInjector() async {
 
  sl.registerLazySingleton<MoviesRemoteDatasource>(
      () => MoviesRemoteDatasourceImpl());

  sl.registerLazySingleton<MovieDetailsUsecase>(
      () => MovieDetailsUsecase(sl()));
  sl.registerLazySingleton<UpcomingMoviesUsecase>(
      () => UpcomingMoviesUsecase(sl()));
  sl.registerLazySingleton<SearchMoviesUsecase>(
      () => SearchMoviesUsecase(sl()));

  sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRespositoryImpl(sl(), sl(),sl()));

  sl.registerFactory<UpcomingMoviesManager>(() => UpcomingMoviesManager(sl()));
  sl.registerFactory<SearchMovieManager>(() => SearchMovieManager(sl()));
  sl.registerFactoryParam<MovieDetailsManager, String, String?>(
      (movieId, _) => MovieDetailsManager(sl(), movieId));
}
