import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/homepage.dart';
import 'package:movie_app/presentation/screens/discovery_page.dart';
import 'package:movie_app/presentation/screens/wishlist_page.dart';
import 'package:movie_app/presentation/widgets/shared/bottom_nav_widget.dart';
import 'package:movie_app/presentation/providers/ui_notifier.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavWidget(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/', builder: (context, state) => const HomePage()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const DiscoveryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/watchlist',
              builder: (context, state) => const WishlistPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      _rootNavigatorKey.currentContext
                              ?.read<UiNotifier>()
                              .selectedIndex =
                          0;
                      _rootNavigatorKey.currentContext?.go('/');
                    },
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: const Center(
                  child: Text('Profile', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
