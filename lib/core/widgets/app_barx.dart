import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';

class AppBarX extends StatelessWidget implements PreferredSizeWidget {
  const AppBarX({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.title,
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                subtitle,
                style: const TextStyle(color: AppTheme.nearyBlue, fontSize: 12),
              ),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
