import 'package:flutter/material.dart';
import 'package:movie_app/core/router.dart';
import 'package:movie_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      supportedLocales: const [Locale('en', 'US')],
    );
  }
}
