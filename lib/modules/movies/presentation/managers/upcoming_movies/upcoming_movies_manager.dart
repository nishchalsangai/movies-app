import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/helpers/failure.dart';

import 'package:movies_app/core/helpers/toast.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/usecases/upcoming_movies_usecase.dart';

class UpcomingMoviesManager extends ChangeNotifier {
  final UpcomingMoviesUsecase _upcomingMoviesUsecase;
  late bool isLoading;
  late PagingController<int, MovieModel> pagingController;
  static const pageSize = 20;

  UpcomingMoviesManager(this._upcomingMoviesUsecase) {
    isLoading = true;
    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((pageKey) {
      upcomingMoviesPaginatedList(pageKey);
    });
  }

  Future<void> upcomingMoviesPaginatedList(int pageKey) async {
    try {
     
      final result = await _upcomingMoviesUsecase.call(pageKey);
      result.fold((l) {
        final isLastPage = l.length < pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(l);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(l, nextPageKey);
        }

        toggleLoading(false);
      }, (r) {
        toggleLoading(false);
        if (r is ServerFailure) {
          showSnackBar(r.exception.toString(), snackType: SnackType.error);
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      toggleLoading(false);
    }
  }

  toggleLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
