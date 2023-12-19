import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/video/data/models/video_detail_response.dart';

abstract class VideoRepository {
  Future<Either<List<VideoModel>, Failure>> getMovieTrailer(String movieId);
}
