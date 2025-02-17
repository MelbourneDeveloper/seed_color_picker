import 'package:flutter/material.dart';

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Basic Card',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                const Text('A simple card with some text content.'),
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(
                  'Card with Header',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text('Secondary text'),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Additional content goes here'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
