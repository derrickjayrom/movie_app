import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/utils/ui_extensions.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/presentation/widgets/movie_details/action_icon.dart';
import 'package:movie_app/presentation/widgets/movie_details/cast_chip.dart';
import 'package:movie_app/presentation/widgets/movie_details/genre_chip.dart';
import 'package:movie_app/presentation/widgets/movie_details/round_icon_button.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

void _enterFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _exitFullScreen() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  bool showTrailer = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TrailerProvider>().loadTrailer(widget.movie.id);
      context.read<MovieCreditsProvider>().loadCredits(widget.movie.id);
    });
  }

  @override
  void dispose() {
    _exitFullScreen();
    // Clear trailer when leaving the page
    context.read<TrailerProvider>().clear(notify: false);
    context.read<MovieCreditsProvider>().clear(notify: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trailerProvider = context.watch<TrailerProvider>();

    if (trailerProvider.controller == null) {
      return _buildScaffold(context, trailerProvider, null);
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: trailerProvider.controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        onReady: () {
          trailerProvider.controller?.unMute();
          trailerProvider.controller?.play();
        },
      ),
      builder: (context, player) {
        return _buildScaffold(context, trailerProvider, player);
      },
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    TrailerProvider trailerProvider,
    Widget? player,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header with Poster/Trailer
            _buildHeader(context, trailerProvider, player),

            /// Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(24),
                  _buildActionButtons(context, trailerProvider),
                  const Gap(32),
                  _buildSynopsis(context),
                  const Gap(32),
                  _buildDirectorSection(context),
                  const Gap(32),
                  _buildCastSection(context),
                  const Gap(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    TrailerProvider trailerProvider,
    Widget? player,
  ) {
    final posterUrl = widget.movie.posterPath != null
        ? '${ApiConstants.imageBaseUrl}${widget.movie.posterPath}'
        : null;

    return Stack(
      children: [
        /// Poster OR Trailer
        SizedBox(
          height: 560,
          width: double.infinity,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showTrailer && player != null
                ? player
                : (posterUrl != null
                      ? Hero(
                          tag: 'movie-poster-${widget.movie.id}',
                          child: Image.network(
                            posterUrl,
                            fit: BoxFit.cover,
                            key: const ValueKey('poster'),
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.white24,
                                  ),
                                ),
                          ),
                        )
                      : Container(
                          color: Colors.grey.shade900,
                          key: const ValueKey('empty'),
                        )),
          ),
        ),

        /// Gradient Overlay
        Container(
          height: 560,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.8),
                Colors.transparent,
                Colors.black.withOpacity(.6),
                Colors.black,
              ],
              stops: const [0.0, 0.4, 0.7, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        /// Close Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 20,
          child: RoundIconButton(
            icon: Icons.close,
            onPressed: () => Navigator.pop(context),
          ),
        ),

        /// Movie Title Info
        Positioned(
          bottom: 0,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.movie.title,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
              const Gap(12),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                  const Gap(6),
                  Text(
                    widget.movie.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    (widget.movie.releaseDate != null &&
                            widget.movie.releaseDate!.isNotEmpty)
                        ? widget.movie.releaseDate!.split('-').first
                        : 'N/A',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const Gap(16),
              Row(children: _buildGenreChips(context)),
              const Gap(20),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildGenreChips(BuildContext context) {
    final movieProvider = context.watch<MovieProvider>();

    final names = widget.movie.genreIds
        .map((id) => movieProvider.getGenreName(id))
        .where((name) => name != 'Unknown')
        .toList();

    final chips = <Widget>[];
    for (var i = 0; i < names.length; i++) {
      chips.add(GenreChip(names[i]));
      if (i != names.length - 1) {
        chips.add(const Gap(8));
      }
    }

    return chips;
  }

  Widget _buildActionButtons(
    BuildContext context,
    TrailerProvider trailerProvider,
  ) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: trailerProvider.trailerKey != null
                ? () {
                    setState(() {
                      showTrailer = true;
                    });
                    _enterFullScreen();
                    trailerProvider.controller?.play();
                  }
                : null,
            icon: trailerProvider.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.play_arrow_rounded, size: 28),
            label: Text(
              trailerProvider.isLoading ? "Loading..." : "Watch Trailer",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Gap(16),
        ActionIcon(Icons.add_rounded, onPressed: () {}),
        const Gap(12),
        ActionIcon(Icons.share_rounded, onPressed: () {}),
      ],
    );
  }

  Widget _buildSynopsis(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Synopsis",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(12),
        Text(
          widget.movie.overview,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .7),
            height: 1.6,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildDirectorSection(BuildContext context) {
    final creditsProvider = context.watch<MovieCreditsProvider>();
    final directorName = creditsProvider.director ?? 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Director",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Gap(12),
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade900,
              child: const Icon(Icons.person, color: Colors.white54, size: 20),
            ),
            const Gap(12),
            Text(
              directorName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCastSection(BuildContext context) {
    final creditsProvider = context.watch<MovieCreditsProvider>();
    final castNames = creditsProvider.cast
        .map((c) => (c['name'] as String?))
        .whereType<String>()
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Gap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: castNames.isEmpty
                ? const []
                : List.generate(castNames.length, (index) {
                    final widgets = <Widget>[CastChip(castNames[index])];
                    if (index != castNames.length - 1) {
                      widgets.add(const Gap(12));
                    }
                    return widgets;
                  }).expand((w) => w).toList(),
          ),
        ),
      ],
    );
  }
}
