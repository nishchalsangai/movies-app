import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_response.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({
    super.key,
    required this.genres,
  });
  final List<Genre> genres;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Genres',
          style: AppTheme.title,
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...List.generate(
              genres.length,
              (index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppTheme
                        .randomColor[index % AppTheme.randomColor.length],
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  genres[index].name ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}