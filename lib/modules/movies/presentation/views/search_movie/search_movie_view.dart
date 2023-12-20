import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/domain/entity/grid_data.dart';
import 'package:movies_app/modules/movies/presentation/managers/search_movie/search_movie_manager.dart';
import 'package:movies_app/modules/movies/presentation/widgets/grid_category_card.dart';
import 'package:movies_app/modules/movies/presentation/widgets/search_card.dart';
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: RefreshIndicator(
            onRefresh: () => Future.sync(
              () => searchMovieManager.pagingController.refresh(),
            ),
            child: PagedListView<int, MovieModel>(
              pagingController: searchMovieManager.pagingController,
              builderDelegate: PagedChildBuilderDelegate<MovieModel>(
                noItemsFoundIndicatorBuilder: (context) {
                  return SizedBox(
                    height: context.height,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.9,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20),
                        itemCount: gridValues.length,
                        itemBuilder: (context, index) {
                          return GridCategoryCard(
                            index: index,
                          );
                        },
                      ),
                    ),
                  );
                },
                itemBuilder: (context, item, index) => InkWell(
                  onTap: () => context.goNamed(RoutePath.movieDetails.name,
                      pathParameters: {'movie_id': item.id.toString()}),
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 20, top: index == 0 ? 20 : 0),
                    child: SearchCard(
                      key: ValueKey(index),
                      movie: item,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
