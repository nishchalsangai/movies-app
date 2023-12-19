// import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:movies_app/core/helpers/app_theme.dart';

class Constants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

  static final logger = Logger();

  static double padding = 20.0;

  // static late List<CameraDescription> cameras;
  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static String apiKey = dotenv.env['API_KEY'] ?? '';

   static List<Color> blackShader  = [
                                AppTheme.baseColor,
                                AppTheme.baseColor,
                                Colors.white,
                                Colors.white,
                                Colors.white,
                                Colors.white
                              ];

  static const dummyNetworkImage =
      'https://images.unsplash.com/photo-1532592333381-a141e3f197c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80';
}
