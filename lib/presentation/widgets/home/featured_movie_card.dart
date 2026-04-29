import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/providers/wishlist_provider.dart';
import 'package:movie_app/presentation/screens/movie_details.dart';
import 'package:movie_app/presentation/widgets/shared/movie_tag.dart';
import 'package:provider/provider.dart';

class FeaturedMovieCard extends StatelessWidget {
  final Movie movie;
  const FeaturedMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate?.split('-')[0] ?? 'N/A';
    final movieProvider = context.read<MovieProvider>();
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
        width: 220,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: 'movie-poster-${movie.id}',
                child: Image.network(
                  '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                  height: 320,
                  width: 220,
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
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Material(
                color: Colors.black.withValues(alpha: .35),
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () => context.read<WishlistProvider>().toggle(movie),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      isWished ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      const Gap(4),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Gap(8),
                      Text(year, style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                  const Gap(8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movie.genreIds.take(2).map((id) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: MovieTag(text: movieProvider.getGenreName(id)),
                        );
                      }).toList(),
                    ),
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
