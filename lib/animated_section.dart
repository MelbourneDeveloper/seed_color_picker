import 'package:flutter/material.dart';

class AnimatedSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const AnimatedSection({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 12),
        child,
      ],
    ),
  );
}
