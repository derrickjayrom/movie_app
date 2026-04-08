import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/homepage.dart';
import 'package:movie_app/presentation/widgets/bottom_nav_widget.dart';

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
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const Scaffold(body: Center(child: Text('Search'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/watchlist',
              builder: (context, state) => const Scaffold(body: Center(child: Text('Watchlist'))),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const Scaffold(body: Center(child: Text('Profile'))),
            ),
          ],
        ),
      ],
    ),
  ],
);
