import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/helpers/image_file.dart';
import 'package:movies_app/core/widgets/image_with_loader.dart';
import 'package:movies_app/modules/movies/data/models/remote/movie_details_response.dart';

class PhotosSlider extends StatefulWidget {
  const PhotosSlider({
    super.key,
    required this.images,
    required this.fullname,
  });
  final List<Backdrop> images;
  final String fullname;

  @override
  State<PhotosSlider> createState() => _PhotosSliderState();
}

class _PhotosSliderState extends State<PhotosSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.images.map((e) {
            return Builder(
              builder: (ctx) {
                return AspectRatio(
                  aspectRatio: e.aspectRatio!,
                  // width: double.infinity,
                  // height: (e.height! * 1.0),
                  child: ImageWithLoader(
                    image: loadImage(e.filePath ?? Constants.dummyNetworkImage),
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            height: context.height / 1.3,
            viewportFraction: 1,
          ),
        ),
      ],
    );
  }
}
