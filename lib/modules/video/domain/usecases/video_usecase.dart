import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/usecase.dart';
import 'package:movies_app/modules/video/data/models/video_detail_response.dart';
import 'package:movies_app/modules/video/domain/repository/video_repository.dart';

class VideoUsecase extends UseCase<List<VideoModel>, String> {
  final VideoRepository _videoRepository;

  VideoUsecase(this._videoRepository);
  @override
  Future<Either<List<VideoModel>, Failure>> call(String params) async =>
      _videoRepository.getMovieTrailer(params);
}
