import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MovieProvider())],
      child: const App(),
    ),
  );
}
