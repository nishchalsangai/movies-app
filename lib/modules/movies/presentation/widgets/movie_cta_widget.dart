import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';

class MovieCTAWidget extends StatelessWidget {
  const MovieCTAWidget({
    super.key,
    required this.releaseDate,
    required this.getTicketsCallBack,
    required this.watchTrailerCallBack,
  });
  final String releaseDate;
  final VoidCallback getTicketsCallBack;
  final VoidCallback watchTrailerCallBack;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'In Theaters $releaseDate',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => getTicketsCallBack(),
              style: AppTheme.styleFrom2,
              child: Text(
                'Get Tickets',
                style: AppTheme.btnTxtStyle,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => watchTrailerCallBack(),
              style: AppTheme.styleFrom,
              label: Text(
                'Watch Trailer',
                style: AppTheme.btnTxtStyle,
              ),
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 34,
        ),
      ],
    );
  }
}