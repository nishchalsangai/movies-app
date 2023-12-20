import 'dart:async';
import 'dart:developer';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/router/router.dart';
import 'package:movies_app/dependency_injection.dart';
import 'package:movies_app/modules/base/manager/base_manager.dart';
import 'package:movies_app/modules/movies/presentation/managers/upcoming_movies/upcoming_movies_manager.dart';
import 'package:movies_app/modules/video/presentation/cubit/video_cubit.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    String storageLocation = (await getApplicationDocumentsDirectory()).path;
    await FastCachedImageConfig.init(
        subDir: storageLocation, clearCacheAfter: const Duration(days: 15));
    await serviceLocator();
    runApp(
      MultiProvider(
        providers: [
          Provider<MyRouter>(
            create: (_) => sl<MyRouter>(),
          ),
          ChangeNotifierProvider(
            lazy: false,
            create: (_) => sl<BottomNavigationManager>(),
          ),
          ChangeNotifierProvider(
            lazy: false,
            create: (_) => sl<UpcomingMoviesManager>(),
          ),
          BlocProvider(
            create: (_) => sl<VideoCubit>(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }, (error, stack) {
    log(error.toString());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    final router = Provider.of<MyRouter>(context, listen: true).router;
    return OKToast(
      child: MaterialApp.router(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: router,
      ),
    );
  }
}
