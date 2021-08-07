import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/core_packages.dart';

class PenguinCard extends StatelessWidget {
  const PenguinCard({Key? key, required this.child, this.background})
      : super(key: key);

  final Widget child;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    final core = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: child,
    );

    return Card(
      margin: EdgeInsets.all(Insets.lg),
      elevation: 8,
      color: Theme.of(context).cardColor.withOpacity(0.95),
      child: background == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: child,
            )
          : Stack(
              children: [
                background!,
                core,
              ],
            ),
    );
  }
}
