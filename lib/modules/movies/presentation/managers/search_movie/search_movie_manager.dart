import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/helpers/failure.dart';
import 'package:movies_app/core/helpers/helper.dart';
import 'package:movies_app/core/helpers/toast.dart';
import 'package:movies_app/modules/movies/data/models/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/search_entity.dart';
import 'package:movies_app/modules/movies/domain/usecases/search_movie_usecase.dart';

class SearchMovieManager extends ChangeNotifier {
  late SearchMoviesUsecase searchMoviesUsecase;
  late bool isLoading;
  late PagingController<int, MovieModel> pagingController;
  late TextEditingController controller;
  static const pageSize = 20;
  SearchMovieManager(this.searchMoviesUsecase) {
    isLoading = true;
    pagingController = PagingController(firstPageKey: 1);
    controller = TextEditingController();
    controller.addListener(() {
      Debouncer(milliseconds: 500).run(() {
        if (controller.text.isNotEmpty) {
          pagingController.refresh();
          searhMovieQuery(controller.text, 1);
        } else {
          if (pagingController.itemList != null &&
              pagingController.itemList!.isNotEmpty) {
            pagingController.itemList = null;
          }
        }
      });
    });
    pagingController.addPageRequestListener((pageKey) {
      searhMovieQuery(controller.text, pageKey);
    });
  }

  void searhMovieQuery(String query, int pageKey) async {
    try {
      final result =
          await searchMoviesUsecase.call(SearchEntity(query, pageKey));
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
}
