import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  bool _isSearching = false;
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<MovieProvider>().searchMovies(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Row(
        children: [
          if (!_isSearching) ...[
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "M",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(10),
            const Text(
              "MovieHub",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _controller,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  suffixIcon: context.watch<MovieProvider>().isSearchLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.close, color: Colors.white54),
                          onPressed: () {
                            setState(() {
                              _isSearching = false;
                              _controller.clear();
                              context.read<MovieProvider>().clearSearch();
                            });
                          },
                        ),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
          if (!_isSearching) ...[
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
            const Gap(8),
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.purple,
              child: Icon(Icons.person, size: 18, color: Colors.white),
            )
          ],
        ],
      ),
    );
  }
}
