import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/toast.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_response.dart';
import 'package:movies_app/modules/movies/domain/usecases/movie_details_usecase.dart';

class MovieDetailsManager extends ChangeNotifier {
  late bool isLoading;
  MovieDetailsResponse? movieDetails;
  late final MovieDetailsUsecase _movieDetailsUsecase;
  late final String movieId;

  MovieDetailsManager(this._movieDetailsUsecase, this.movieId) {
    isLoading = false;
    movieDetailsCall();
  }

  Future<void> movieDetailsCall() async {
    toggleLoading(true);
    final result = await _movieDetailsUsecase.call(movieId);
    result.fold((l) {
      movieDetails = l;
      toggleLoading(false);
    }, (r) {
      toggleLoading(false);
      if (r is ServerFailure) {
        showSnackBar(r.exception.toString(), snackType: SnackType.error);
      }
      showSnackBar(r.toString(), snackType: SnackType.error);
    });
  }

  toggleLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }
}
