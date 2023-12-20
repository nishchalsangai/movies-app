import 'dart:convert';

import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';

SearchMovieResponse searchMovieResponseFromJson(String str) =>
    SearchMovieResponse.fromJson(json.decode(str));

class SearchMovieResponse {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  SearchMovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SearchMovieResponse copyWith({
    int? page,
    List<MovieModel>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SearchMovieResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory SearchMovieResponse.fromJson(Map<String, dynamic> json) =>
      SearchMovieResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
