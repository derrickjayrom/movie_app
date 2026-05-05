import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/widgets/shared/movie_card.dart';
import 'package:provider/provider.dart';

class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          'Trending Movies',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.trendingMovies.isEmpty) {
            return const Center(child: CircularProgressIndicator(color: Colors.red));
          }

          if (provider.error != null) {
            return Center(
              child: Text(
                provider.error!,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (provider.trendingMovies.isEmpty) {
            return const Center(
              child: Text(
                'No trending movies available',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: provider.trendingMovies.length,
              itemBuilder: (context, index) {
                final movie = provider.trendingMovies[index];
                return MovieCard(movie: movie);
              },
            ),
          );
        },
      ),
    );
  }
}
