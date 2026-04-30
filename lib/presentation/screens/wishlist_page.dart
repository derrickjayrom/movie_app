import 'package:flutter/material.dart';
import 'package:movie_app/presentation/providers/wishlist_provider.dart';
import 'package:movie_app/presentation/providers/ui_notifier.dart';
import 'package:movie_app/presentation/widgets/shared/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = context.watch<WishlistProvider>();
    final items = wishlist.items;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.read<UiNotifier>().selectedIndex = 0;
            context.go('/');
          },
        ),
        title: const Text('Watchlist'),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'Your watchlist is empty',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: items[index]);
              },
            ),
    );
  }
}
