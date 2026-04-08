import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/widgets/trending_movie_card.dart';

class TrendingMoviesSection extends StatelessWidget {
  final List<Movie> movies;
  const TrendingMoviesSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trending Movies",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Gap(12),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => TrendingMovieCard(movie: movies[i]),
            separatorBuilder: (_, __) => const Gap(14),
            itemCount: movies.length,
          ),
        )
      ],
    );
  }
}
