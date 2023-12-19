import 'package:bloc/bloc.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/toast.dart';
import 'package:movies_app/modules/video/data/models/video_detail_response.dart';
import 'package:movies_app/modules/video/domain/usecases/video_usecase.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoUsecase) : super(VideoState.initial());

 
  final VideoUsecase videoUsecase;

  void movieVideos(String movieId) async {
    emit(state.copyWith(videoStatus: VideoStatus.loading));
    final result = await videoUsecase.call(movieId);
    result.fold((l) {
      emit(state.copyWith(videoStatus: VideoStatus.success, videos: l));
    }, (r) {
      if (r is ServerFailure) {
        emit(state.copyWith(
            videoStatus: VideoStatus.failure, message: r.exception.toString()));
        showSnackBar(r.exception.toString());
      }
    });
  }
}
