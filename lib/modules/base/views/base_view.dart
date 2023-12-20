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
          GoRouter.of(context).location == RoutePath.search.path ||
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
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(27)),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            reverseDuration: const Duration(milliseconds: 100),
            child: showBottomBar
                ? BottomNavigationBar(
                    onTap: (index) {
                      // bottomNavigationManager.navigateToIndex(index);
                    },
                    backgroundColor: AppTheme.primaryColor,
                    currentIndex: bottomNavigationManager.selectedIndex,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: AppTheme.bodyTextColor,
                    selectedFontSize: 12,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: const TextStyle(color: Colors.black),
                    unselectedLabelStyle:
                        const TextStyle(color: AppTheme.bodyTextColor),
                    items: bottomNavigationManager.menuItems
                        .map(
                          (BottomNavigationItem menuItem) =>
                              BottomNavigationBarItem(
                                  icon: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      bottomNavigationManager.selectedIndex ==
                                              bottomNavigationManager.menuItems
                                                  .indexOf(menuItem)
                                          ? Colors.white
                                          : AppTheme.greyColorLight
                                              .withOpacity(0.3),
                                      BlendMode.srcATop,
                                    ),
                                    child: Image.asset(
                                      menuItem.icon,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                  label: menuItem.name,
                                  activeIcon:
                                      bottomNavigationManager.selectedIndex == 3
                                          ? const Icon(Icons.list)
                                          : null),
                        )
                        .toList(),
                  )
                : const SizedBox(),
          ),
        ),
        body: PageStorage(bucket: bucket, child: widget.child),
      );
    });
  }
}
