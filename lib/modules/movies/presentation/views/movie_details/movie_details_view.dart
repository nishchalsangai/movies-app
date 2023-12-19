import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/helpers/image_file.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/core/widgets/error_view.dart';
import 'package:movies_app/core/widgets/image_with_loader.dart';
import 'package:movies_app/modules/movies/presentation/managers/movie_details/movie_details_manager.dart';
import 'package:movies_app/modules/movies/presentation/widgets/genre_widget.dart';
import 'package:movies_app/modules/movies/presentation/widgets/movie_cta_widget.dart';
import 'package:movies_app/modules/video/presentation/cubit/video_cubit.dart';
import 'package:provider/provider.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<VideoCubit>(context)
        .movieVideos(context.read<MovieDetailsManager>().movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailsManager>(
        builder: (context, movieDetailsManager, child) {
      return movieDetailsManager.isLoading
          ? const CircularProgressIndicator.adaptive()
          : movieDetailsManager.movieDetails == null
              ? const ErrorView()
              : Scaffold(
                  extendBody: true,
                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: true,
                        leading: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        expandedHeight: context.height / 2,
                        backgroundColor: AppTheme.baseColor,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                        colors: Constants.blackShader,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)
                                    .createShader(bounds),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ImageWithLoader(
                                    image: loadImage(movieDetailsManager
                                            .movieDetails!.posterPath ??
                                        Constants.dummyNetworkImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: MovieCTAWidget(
                                  releaseDate: movieDetailsManager
                                              .movieDetails!.releaseDate !=
                                          null
                                      ? movieDetailsManager
                                          .movieDetails!.releaseDate!
                                          .toDayMonthYear()
                                      : '',
                                  getTicketsCallBack: () {},
                                  watchTrailerCallBack: () {
                                    context.pushNamed(RoutePath.video.name,
                                        pathParameters: {
                                          'video_id': context
                                              .read<VideoCubit>()
                                              .state
                                              .videos!
                                              .first
                                              .key!
                                        });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///GENRES
                              if (movieDetailsManager.movieDetails!.genres !=
                                      null &&
                                  movieDetailsManager
                                      .movieDetails!.genres!.isNotEmpty)
                                GenreWidget(
                                  genres:
                                      movieDetailsManager.movieDetails!.genres!,
                                ),

                              ///DIVIDER
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color:
                                      AppTheme.greyColorLight.withOpacity(0.5),
                                ),
                              ),

                              ///OVERVIEW
                              if (movieDetailsManager.movieDetails!.overview !=
                                      null &&
                                  movieDetailsManager
                                      .movieDetails!.overview!.isNotEmpty)
                                OverviewWidget(
                                  overview: movieDetailsManager
                                      .movieDetails!.overview!,
                                )
                            ],
                          ),
                        ),
                      ]))
                    ],
                  ),
                );
    });
  }
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: AppTheme.title,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          overview,
          style: const TextStyle(color: AppTheme.bodyTextColor),
        ),
      ],
    );
  }
}
