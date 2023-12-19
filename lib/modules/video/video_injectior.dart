import 'package:movies_app/dependency_injection.dart';
import 'package:movies_app/modules/video/data/datasources/video_remote_datasource.dart';
import 'package:movies_app/modules/video/data/respository/video_repository_impl.dart';
import 'package:movies_app/modules/video/domain/repository/video_repository.dart';
import 'package:movies_app/modules/video/domain/usecases/video_usecase.dart';
import 'package:movies_app/modules/video/presentation/cubit/video_cubit.dart';

Future<void> videoInjector() async {
  sl.registerLazySingleton<VideoRemoteDatasource>(
      () => VideoRemoteDatasourceImpl());

  sl.registerLazySingleton<VideoUsecase>(() => VideoUsecase(sl()));

  sl.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl(sl()));

  sl.registerLazySingleton<VideoCubit>(
      () => VideoCubit(sl()));
}
