part of 'video_cubit.dart';

enum VideoStatus { initial, loading, success, failure }

class VideoState {
  final VideoStatus videoStatus;
  List<VideoModel>? videos;
  String? message;

  VideoState({required this.videoStatus, this.videos, this.message});

  VideoState.initial() : this(videoStatus: VideoStatus.initial);

  VideoState copyWith({
    VideoStatus? videoStatus,
    List<VideoModel>? videos,
    String? message,
  }) {
    return VideoState(
      videoStatus: videoStatus ?? this.videoStatus,
      videos: videos ?? this.videos,
      message: message ?? this.message,
    );
  }
}
