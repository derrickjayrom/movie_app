import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';
import 'package:movie_app/presentation/widgets/movie_details/cast_chip.dart';

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({super.key});

  @override
  Widget build(BuildContext context) {
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
