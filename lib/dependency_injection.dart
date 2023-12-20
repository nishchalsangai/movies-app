import 'package:get_it/get_it.dart';
import 'package:movies_app/core/router/router.dart';
import 'package:movies_app/modules/base/manager/base_manager.dart';
import 'package:movies_app/modules/movies/data/datasources/local/app_database.dart';
import 'package:movies_app/modules/movies/movie_injector.dart';
import 'package:movies_app/modules/video/video_injectior.dart';
import 'package:movies_app/services/internet_service.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
   final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerLazySingleton<InternetService>(() => InternetServiceImpl());
  sl.registerFactory<BottomNavigationManager>(() => BottomNavigationManager());
  sl.registerFactory<MyRouter>(() => MyRouter());
  movieInjector();
  videoInjector();
}
