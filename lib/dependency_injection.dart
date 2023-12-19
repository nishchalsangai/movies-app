import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movies/movie_injector.dart';
import 'package:movies_app/modules/video/video_injectior.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  movieInjector();
  videoInjector();
}
