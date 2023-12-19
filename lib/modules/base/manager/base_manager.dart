import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/constants.dart';
import 'package:movies_app/core/router/route_path.dart';

class BottomNavigationItem {
  String name;
  String icon;
  Function onTap;
  BottomNavigationItem({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}

class BottomNavigationManager extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;

  final List<BottomNavigationItem> _menuItems = [
    BottomNavigationItem(
        name: "Dashboard",
        icon: Assets.dashIcon,
        onTap: () {
          Constants.shellNavigatorKey.currentContext!
              .goNamed(RoutePath.dashboard.name);
        }),
    BottomNavigationItem(
        name: "Watch",
        icon: Assets.watchIcon,
        onTap: () {
          Constants.shellNavigatorKey.currentContext!
              .goNamed(RoutePath.upcomingMovies.name);
        }),
    BottomNavigationItem(
        name: "Media",
        icon: Assets.mediaIcon,
        onTap: () {
          Constants.shellNavigatorKey.currentContext!
              .goNamed(RoutePath.media.name);
        }),
    BottomNavigationItem(
        name: "More",
        icon: Assets.moreIcon,
        onTap: () {
          Constants.shellNavigatorKey.currentContext!
              .goNamed(RoutePath.more.name);
        }),
  ];
  // BottomNavigationManager() {
  //   navigateToIndex(1);
  // }

  void navigateToIndex(index) {
    _selectedIndex = index;
    _menuItems[selectedIndex].onTap();
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  List<BottomNavigationItem> get menuItems => _menuItems;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}
