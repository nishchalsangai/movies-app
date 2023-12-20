import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';
import 'package:movies_app/modules/movies/presentation/managers/upcoming_movies/upcoming_movies_manager.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movie_container.dart';
import 'package:provider/provider.dart';

class UpcomingMoviesView extends StatefulWidget {
  const UpcomingMoviesView({super.key});

  @override
  State<UpcomingMoviesView> createState() => _UpcomingMoviesViewState();
}

class _UpcomingMoviesViewState extends State<UpcomingMoviesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Watch',
          style: context.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.push(RoutePath.search.path);
            },
            icon: const Hero(
              tag: 'search-hero',
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.padding),
        child: Consumer<UpcomingMoviesManager>(
            builder: (context, upcomingMoviesManager, child) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(
              () => upcomingMoviesManager.pagingController.refresh(),
            ),
            child: PagedListView<int, MovieModel>(
              pagingController: upcomingMoviesManager.pagingController,
              builderDelegate: PagedChildBuilderDelegate<MovieModel>(
                itemBuilder: (context, item, index) => InkWell(
                  onTap: () => context.goNamed(RoutePath.movieDetails.name,
                      pathParameters: {'movie_id': item.id.toString()}),
                  child: MovieContainer(
                    index: index,
                    item: item,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
