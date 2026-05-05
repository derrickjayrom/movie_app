import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/widgets/home/trending_movie_card.dart';

class PopularMoviesSection extends StatelessWidget {
  final List<Movie> movies;
  const PopularMoviesSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    final limitedMovies = movies.take(4).toList();
    final hasMoreMovies = movies.length > 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular Movies",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasMoreMovies)
              GestureDetector(
                onTap: () => context.go('/popular-movies'),
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        const Gap(12),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => TrendingMovieCard(movie: limitedMovies[i]),
            separatorBuilder: (_, __) => const Gap(14),
            itemCount: limitedMovies.length,
          ),
        ),
      ],
    );
  }
}
