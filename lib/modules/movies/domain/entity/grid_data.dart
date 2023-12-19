import 'package:movies_app/core/helpers/assets.dart';

class GridData {
  final String path;
  final String name;
  const GridData(this.path, this.name);
}

const gridValues = [
  GridData(Assets.comedies, 'Comedies'),
  GridData(Assets.crime, 'Crime'),
  GridData(Assets.family, 'Family'),
  GridData(Assets.doc, 'Documentaries'),
  GridData(Assets.drama, 'Dramas'),
  GridData(Assets.fantasy, 'Fantasy'),
  GridData(Assets.holidays, 'Holidays'),
  GridData(Assets.horror, 'Horror'),
  GridData(Assets.scifi, 'Sci-Fi'),
  GridData(Assets.thriller, 'Thriller'),
];
