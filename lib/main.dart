import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/providers/ui_notifier.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';
import 'package:movie_app/presentation/providers/discovery_provider.dart';
import 'package:movie_app/presentation/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('fr', 'FR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      useOnlyLangCode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MovieProvider()),
          ChangeNotifierProvider(create: (_) => TrailerProvider()),
          ChangeNotifierProvider(create: (_) => MovieCreditsProvider()),
          ChangeNotifierProvider(create: (_) => DiscoveryProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
          ChangeNotifierProvider(create: (_) => UiNotifier()),
        ],
        child: const App(),
      ),
    ),
  );
}
