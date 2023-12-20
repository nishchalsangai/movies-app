import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/image_file.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    movie.posterPath.isEmpty &&
                            (movie.backdropPath == null ||
                                movie.backdropPath!.isEmpty)
                        ? Constants.dummyNetworkImage
                        : loadImage(movie.backdropPath ?? movie.posterPath),
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.originalTitle,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                movie.originalLanguage,
                style: const TextStyle(color: AppTheme.bodyTextColor),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.more_horiz,
          color: AppTheme.nearyBlue,
        ),
      ],
    );
  }
}
