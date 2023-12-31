import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/image_file.dart';
import 'package:movies_app/core/widgets/image_with_loader.dart';
import 'package:movies_app/modules/movies/data/models/remote/upcoming_movies_response.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    super.key,
    required this.index,
    required this.item,
  });
  final int index;
  final MovieModel item;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(
          top: index == 0 ? 20 : 0,
          bottom: 20,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppTheme.greyColorLight.withOpacity(0.2),
              blurRadius: 0.5,
              spreadRadius: 0.9)
        ]),
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                        colors: Constants.blackShader,
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)
                    .createShader(bounds);
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageWithLoader(
                  image: item.posterPath.isEmpty &&
                          (item.backdropPath == null ||
                              item.backdropPath!.isEmpty)
                      ? Constants.dummyNetworkImage
                      : loadImage(item.backdropPath ?? item.posterPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(Constants.padding),
                child: Text(
                  item.originalTitle,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
