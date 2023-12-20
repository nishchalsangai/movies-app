import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';

class ImageWithLoader extends StatelessWidget {
  const ImageWithLoader({super.key, required this.image, this.fit});
  final String image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return FastCachedImage(
      url: image,
      loadingBuilder: (context, progress) {
        return SizedBox(
          width: double.infinity,
          // color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppTheme.primaryColor,
                      value: progress.progressPercentage.value)),
            ],
          ),
        );
      },
      fit: fit,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.greyColorLight.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: const Icon(Icons.error_sharp),
        ); // or any other error widget you prefer
      },
    );
  }
}
