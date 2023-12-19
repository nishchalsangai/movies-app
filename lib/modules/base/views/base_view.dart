import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/core/router/router.dart';
import 'package:movies_app/modules/base/manager/base_manager.dart';
import 'package:provider/provider.dart';

class BaseView extends StatefulWidget {
  final Widget child;
  const BaseView({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final PageStorageBucket bucket = PageStorageBucket();
  late bool showBottomBar;
  @override
  void initState() {
    showBottomBar = true;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<MyRouter>(context)
        .router
        .addListener(() => routeEventHandler());
  }

  void routeEventHandler() {
    if (mounted) {
      if (GoRouter.of(context).location == RoutePath.dashboard.path ||
          GoRouter.of(context).location == RoutePath.upcomingMovies.path ||
          GoRouter.of(context).location == RoutePath.media.path ||
          GoRouter.of(context).location == RoutePath.more.path) {
        showBottomBar = true;
        setState(() {});
      } else {
        showBottomBar = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationManager>(
        builder: (context, bottomNavigationManager, _) {
      return Scaffold(
        // extendBody: true,
        bottomNavigationBar: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          reverseDuration: const Duration(milliseconds: 100),
          child: showBottomBar
              ? BottomNavigationBar(
                  elevation: 25,
                  onTap: (index) {
                    bottomNavigationManager.navigateToIndex(index);
                  },
                  backgroundColor: AppTheme.primaryColor,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: const Color(0xff9E9E9E),
                  type: BottomNavigationBarType.fixed,
                  items: bottomNavigationManager.menuItems
                      .map(
                        (BottomNavigationItem menuItem) =>
                            BottomNavigationBarItem(
                          icon: Image.asset(
                            menuItem.icon,
                            color: bottomNavigationManager.selectedIndex ==
                                    bottomNavigationManager.menuItems
                                        .indexOf(menuItem)
                                ? Colors.white
                                : AppTheme.greyColorLight,
                          ),
                          label: menuItem.name,
                        ),
                      )
                      .toList(),
                )
              : const SizedBox(),
        ),
        body: PageStorage(
            bucket: bucket,
            child: widget.child), //widgetOptions[_selectedIndex]
      );
    });
  }
}
