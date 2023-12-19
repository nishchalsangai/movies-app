import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/video/data/datasources/video_remote_datasource.dart';
import 'package:movies_app/modules/video/data/models/video_detail_response.dart';
import 'package:movies_app/modules/video/domain/repository/video_repository.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoRemoteDatasource videoRemoteDatasource;

  VideoRepositoryImpl(
    this.videoRemoteDatasource,
  );
  @override
  Future<Either<List<VideoModel>, Failure>> getMovieTrailer(
      String movieId) async {
    final result =
        await videoRemoteDatasource.fetchMovieVideo(movieId: movieId);
    return result.fold((l) => Left(l.results ?? []), (r) => Right(r));
  }
}
