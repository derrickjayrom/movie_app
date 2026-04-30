import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/presentation/providers/discovery_provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/providers/ui_notifier.dart';
import 'package:movie_app/presentation/widgets/shared/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DiscoveryProvider>().init();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 450), () {
      if (!mounted) return;
      context.read<DiscoveryProvider>().setQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final discovery = context.watch<DiscoveryProvider>();
    final movieProvider = context.watch<MovieProvider>();

    final genreEntries = movieProvider.genres.entries.toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.read<UiNotifier>().selectedIndex = 0;
            context.go('/');
          },
        ),
        title: const Text('Discovery', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  suffixIcon: discovery.query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Colors.white54),
                          onPressed: () {
                            _controller.clear();
                            context.read<DiscoveryProvider>().setQuery('');
                          },
                        )
                      : null,
                ),
                onChanged: _onSearchChanged,
              ),
              const Gap(14),
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: genreEntries.length + 1,
                  separatorBuilder: (_, __) => const Gap(10),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      final isSelected = discovery.selectedGenreId == null;
                      return _GenreChip(
                        label: 'All',
                        isSelected: isSelected,
                        onTap: () =>
                            context.read<DiscoveryProvider>().setGenre(null),
                      );
                    }

                    final entry = genreEntries[index - 1];
                    final isSelected = discovery.selectedGenreId == entry.key;
                    return _GenreChip(
                      label: entry.value,
                      isSelected: isSelected,
                      onTap: () =>
                          context.read<DiscoveryProvider>().setGenre(entry.key),
                    );
                  },
                ),
              ),
              const Gap(12),
              Row(
                children: [
                  const Text(
                    'Sort',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(12),
                  DropdownButton<String>(
                    value: discovery.sortBy,
                    dropdownColor: Colors.grey.shade900,
                    style: const TextStyle(color: Colors.white),
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(
                        value: 'popularity.desc',
                        child: Text('Popular'),
                      ),
                      DropdownMenuItem(
                        value: 'vote_average.desc',
                        child: Text('Top Rated'),
                      ),
                      DropdownMenuItem(
                        value: 'primary_release_date.desc',
                        child: Text('Newest'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<DiscoveryProvider>().setSortBy(value);
                    },
                  ),
                  const Spacer(),
                  if (discovery.isLoading)
                    const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white54,
                      ),
                    ),
                ],
              ),
              const Gap(12),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (discovery.error != null) {
                      return Center(
                        child: Text(
                          discovery.error!,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      );
                    }

                    if (!discovery.isLoading && discovery.results.isEmpty) {
                      return const Center(
                        child: Text(
                          'No movies found',
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                      itemCount: discovery.results.length,
                      itemBuilder: (context, index) {
                        return MovieCard(movie: discovery.results[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenreChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white10,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
