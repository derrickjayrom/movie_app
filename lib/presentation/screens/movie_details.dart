import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/widgets/movie_details/action_icon.dart';
import 'package:movie_app/presentation/widgets/movie_details/cast_chip.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_header.dart';

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

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  bool showTrailer = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    final trailerProvider = context.read<TrailerProvider>();
    final creditsProvider = context.read<MovieCreditsProvider>();

    trailerProvider.loadTrailer(widget.movie.id);
    creditsProvider.loadCredits(widget.movie.id);
  }

  @override
  void deactivate() {
    // Stop video when navigating away
    final controller = context.read<TrailerProvider>().controller;
    if (controller != null && controller.value.isPlaying) {
      controller.pause();
      controller.seekTo(Duration.zero);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _exitFullScreen();
    context.read<TrailerProvider>().clear(notify: false);
    context.read<MovieCreditsProvider>().clear(notify: false);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = context.read<TrailerProvider>().controller;

    if (controller == null) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden) {
      controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final trailerProvider = context.read<TrailerProvider>();

    if (trailerProvider.controller == null) {
      return _buildScaffold(context, trailerProvider, null);
    }

    return RepaintBoundary(
      child: YoutubePlayerBuilder(
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
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    TrailerProvider trailerProvider,
    Widget? player,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                backgroundColor: Colors.black,
                automaticallyImplyLeading: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: MovieHeader(
                    movie: widget.movie,
                    player: player,
                    showTrailer: showTrailer,
                    onCloseTrailer: () {
                      setState(() {
                        showTrailer = false;
                      });
                      _exitFullScreen();
                      final controller = context
                          .read<TrailerProvider>()
                          .controller;
                      if (controller != null) {
                        controller.pause();
                        controller.seekTo(Duration.zero);
                      }
                    },
                    onTogglePlayPause: () {
                      final controller = context
                          .read<TrailerProvider>()
                          .controller;
                      if (controller != null) {
                        if (controller.value.isPlaying) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      }
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(24),
                      Selector<TrailerProvider, bool>(
                        selector: (_, provider) => provider.isLoading,
                        builder: (_, isLoading, __) {
                          return _buildActionButtons(
                            context,
                            trailerProvider,
                            isLoading,
                          );
                        },
                      ),
                      const Gap(32),
                      _buildSynopsis(context),
                      const Gap(32),
                      _buildDirectorSection(context),
                      const Gap(32),
                      RepaintBoundary(child: _buildCastSection(context)),
                      const Gap(40),
                    ],
                  ),
                ),
              ),
            ],
          ),

          if (showTrailer)
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 20,
              child: Material(
                color: Colors.black.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  borderRadius: BorderRadius.circular(999),
                  onTap: () {
                    setState(() {
                      showTrailer = false;
                    });
                    _exitFullScreen();
                    final controller = context
                        .read<TrailerProvider>()
                        .controller;
                    if (controller != null) {
                      controller.pause();
                      controller.seekTo(Duration.zero);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.close, color: Colors.white, size: 24),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    TrailerProvider trailerProvider,
    bool isLoading,
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
            icon: isLoading
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
              isLoading ? "Loading..." : "Watch Trailer",
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
