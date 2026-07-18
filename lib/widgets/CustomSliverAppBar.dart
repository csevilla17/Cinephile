import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      title: Text(
        'Explorar',
        style: textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: const Color(0xFFF8FAFC),
        ),
      ),
      floating: true,
      backgroundColor: colorScheme.surface,
      elevation: 0,
    );
  }
}
