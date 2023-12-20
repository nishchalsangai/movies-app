import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';

class SeatLegends extends StatelessWidget {
  const SeatLegends({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: AppTheme.bodyTextColor),
        ),
      ],
    );
  }
}