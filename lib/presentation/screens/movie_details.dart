import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_synopsis.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_action_buttons.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_director.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_cast.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_close_button.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_details_sliver_app_bar.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  bool showTrailer = false;

  void _enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _exitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

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

  Widget _buildScrollViewContent(
    BuildContext context,
    TrailerProvider trailerProvider,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            Selector<TrailerProvider, bool>(
              selector: (_, provider) => provider.isLoading,
              builder: (_, isLoading, __) {
                return MovieDetailsActionButtons(
                  trailerProvider: trailerProvider,
                  isLoading: isLoading,
                  onWatchTrailer: () {
                    setState(() {
                      showTrailer = true;
                    });
                    _enterFullScreen();
                    trailerProvider.controller?.play();
                  },
                );
              },
            ),
            const Gap(32),
            MovieDetailsSynopsis(synopsis: widget.movie.overview),
            const Gap(32),
            const MovieDetailsDirector(),
            const Gap(32),
            const RepaintBoundary(child: MovieDetailsCast()),
            const Gap(40),
          ],
        ),
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
              MovieDetailsSliverAppBar(
                movie: widget.movie,
                player: player,
                showTrailer: showTrailer,
                onCloseTrailer: () {
                  setState(() {
                    showTrailer = false;
                  });
                  _exitFullScreen();
                  final controller = context.read<TrailerProvider>().controller;
                  if (controller != null) {
                    controller.pause();
                    controller.seekTo(Duration.zero);
                  }
                },
                onTogglePlayPause: () {
                  final controller = context.read<TrailerProvider>().controller;
                  if (controller != null) {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  }
                },
              ),
              _buildScrollViewContent(context, trailerProvider),
            ],
          ),
          if (showTrailer)
            MovieDetailsCloseButton(
              onClose: () {
                setState(() {
                  showTrailer = false;
                });
                _exitFullScreen();
                final controller = context.read<TrailerProvider>().controller;
                if (controller != null) {
                  controller.pause();
                  controller.seekTo(Duration.zero);
                }
              },
            ),
        ],
      ),
    );
  }
}
