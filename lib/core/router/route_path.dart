import 'package:movies_app/core/router/route_name.dart';

class RoutePath {
  static RouteName seatMapping = RouteName(
    'seat-mapping',
  );
  static RouteName videos = RouteName(
    'videos',
  );
  static RouteName search = RouteName(
    'search',
  );

  static RouteName dashboard = RouteName(
    'dash',
  );
  static RouteName media = RouteName(
    'media',
  );
  static RouteName upcomingMovies = RouteName(
    'upcoming-movies',
  );

  static RouteName movieDetails = RouteName(
    'movie-details',
    subRoute: true,
  );

  static RouteName video = RouteName(
    'video',
 
  );


  static RouteName more = RouteName(
    'more',
  );
}
