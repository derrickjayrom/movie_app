import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/presentation/widgets/home/featured_movies_section.dart';
import 'package:movie_app/presentation/widgets/home/home_header.dart';
import 'package:movie_app/presentation/widgets/home/popular_movies_section.dart';
import 'package:movie_app/presentation/widgets/home/trending_movies_section.dart';
import 'package:movie_app/presentation/widgets/shared/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieProvider>().fetchAllMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MovieProvider>();

    if (provider.isLoading && provider.trendingMovies.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.red)),
      );
    }

    if (provider.error != null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            provider.error!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const HomeHeader(),
              const Gap(25),
              if (provider.searchQuery.isNotEmpty) ...[
                Text(
                  "Results for '${provider.searchQuery}'",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
                if (provider.searchResults.isEmpty && !provider.isLoading)
                  const Center(
                    child: Text(
                      "No movies found",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    itemCount: provider.searchResults.length,
                    itemBuilder: (context, index) {
                      final movie = provider.searchResults[index];
                      return MovieCard(movie: movie);
                    },
                  ),
              ] else ...[
                FeaturedMoviesSection(
                  movies: provider.trendingMovies.take(5).toList(),
                ),
                const Gap(25),
                TrendingMoviesSection(movies: provider.trendingMovies),
                const Gap(25),
                PopularMoviesSection(movies: provider.popularMovies),
              ],
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
