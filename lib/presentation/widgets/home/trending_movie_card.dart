import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/wishlist_provider.dart';
import 'package:movie_app/presentation/screens/movie_details.dart';
import 'package:provider/provider.dart';

class TrendingMovieCard extends StatelessWidget {
  final Movie movie;
  const TrendingMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate?.split('-')[0] ?? 'N/A';
    final wishlist = context.watch<WishlistProvider>();
    final isWished = wishlist.contains(movie);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(movie: movie),
          ),
        );
      },
      child: SizedBox(
        width: 130,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'movie-poster-${movie.id}',
                child: Image.network(
                  '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                  height: 180,
                  width: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: .7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Material(
                color: Colors.black.withValues(alpha: .35),
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () => context.read<WishlistProvider>().toggle(movie),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(
                      isWished ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 14),
                      const Gap(4),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        year,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
