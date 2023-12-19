import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/dependency_injection.dart';
import 'package:movies_app/modules/base/views/base_view.dart';
import 'package:movies_app/modules/dashboard/views/dashboard_view.dart';
import 'package:movies_app/modules/media_library/views/media_library_view.dart';
import 'package:movies_app/modules/more/views/more_view.dart';
import 'package:movies_app/modules/movies/presentation/managers/movie_details/movie_details_manager.dart';
import 'package:movies_app/modules/movies/presentation/managers/search_movie/search_movie_manager.dart';
import 'package:movies_app/modules/movies/presentation/views/movie_details/movie_details_view.dart';
import 'package:movies_app/modules/movies/presentation/views/search_movie/search_movie_view.dart';
import 'package:movies_app/modules/movies/presentation/views/upcoming_movies/upcoming_movies_view.dart';
import 'package:movies_app/modules/video/presentation/views/video_view.dart';
import 'package:provider/provider.dart';

CustomTransitionPage buildPageWithSlideTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      if (kIsWeb) {
        return child;
      } else {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return SlideTransition(
            position: tween.animate(curvedAnimation), child: child);
      }
    },
  );
}

class MyRouter {
  MyRouter();

  late final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: Constants.navigatorKey,
    initialLocation: RoutePath.upcomingMovies.path,
    routerNeglect: true,
    // refreshListenable: appService,
    redirect: (context, state) {
      return null;
    },

    routes: [
      ShellRoute(
          navigatorKey: Constants.shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, child) =>
              BaseView(
                child: child,
              ),
          routes: [
            GoRoute(
              name: RoutePath.dashboard.name,
              path: RoutePath.dashboard.path,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const NoTransitionPage(
                    child: DashboardView() // state: state,
                    );
              },
            ),
            GoRoute(
                name: RoutePath.upcomingMovies.name,
                path: RoutePath.upcomingMovies.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                    child: UpcomingMoviesView(),
                  );
                },
                routes: [
                  GoRoute(
                    name: RoutePath.movieDetails.name,
                    path: '${RoutePath.movieDetails.path}/:movie_id',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final movieId = state.pathParameters['movie_id'] ?? '';
                      return buildPageWithSlideTransition(
                        child: ChangeNotifierProvider(
                            lazy: false,
                            create: (context) =>
                                sl<MovieDetailsManager>(param1: movieId),
                            child: const MovieDetailsView()),
                        context: context,
                        state: state,
                      );
                    },
                  ),
                ]),
            GoRoute(
              name: RoutePath.media.name,
              path: RoutePath.media.path,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const NoTransitionPage(
                  child: MediaLibraryView(),
                );
              },
            ),
            GoRoute(
              name: RoutePath.more.name,
              path: RoutePath.more.path,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return const NoTransitionPage(
                  child: MoreView(),
                );
              },
            ),
          ]),
      GoRoute(
        name: RoutePath.video.name,
        path: '${RoutePath.video.path}/:video_id',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final videoId = state.pathParameters['video_id'] ?? '';
          return buildPageWithSlideTransition(
            child: VideoView(
              id: videoId,
            ),
            context: context,
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.search.name,
        path: RoutePath.search.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithSlideTransition(
            child: ChangeNotifierProvider(
              create: (_) => sl<SearchMovieManager>(),
              child: const SearchMovieView(),
            ),
            context: context,
            state: state,
          );
        },
      ),
    ],
  );
}
