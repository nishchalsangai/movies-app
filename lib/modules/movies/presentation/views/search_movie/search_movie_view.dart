import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/helper.dart';
import 'package:movies_app/modules/movies/presentation/managers/search_movie/search_movie_manager.dart';
import 'package:movies_app/modules/movies/presentation/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class SearchMovieView extends StatefulWidget {
  const SearchMovieView({super.key});

  @override
  State<SearchMovieView> createState() => _SearchMovieViewState();
}

class _SearchMovieViewState extends State<SearchMovieView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchMovieManager>(
        builder: (context, searchMovieManager, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SearchWidget(
            controller: searchMovieManager.controller,
          ),
        ),
      );
    });
  }
}
