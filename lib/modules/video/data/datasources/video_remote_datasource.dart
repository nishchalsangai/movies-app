import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/end_points.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/modules/video/data/models/video_detail_response.dart';
import 'package:movies_app/services/network_service.dart';

sealed class VideoRemoteDatasource {
  Future<Either<VideoDetailsResponse, Failure>> fetchMovieVideo(
      {required String movieId});
}

class VideoRemoteDatasourceImpl implements VideoRemoteDatasource {
  @override
  Future<Either<VideoDetailsResponse, Failure>> fetchMovieVideo(
      {required String movieId}) async {
    try {
      final response = await NetworkService.get(
          url:
              '${Constants.baseUrl}$movieId/${EndPoints.videos}?api_key=${Constants.apiKey}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Left(videoDetailsResponseFromJson(response.body));
      } else {
        return Right(
            ServerFailure(exception: Exception(response.reasonPhrase)));
      }
    } on Exception catch (e) {
      return Right(ServerFailure(exception: Exception(e)));
    }
  }
}
