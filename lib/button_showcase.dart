import 'package:flutter/material.dart';

class ButtonShowcase extends StatelessWidget {
  const ButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Elevated Buttons', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Primary')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('With Icon'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Filled Buttons', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilledButton(onPressed: () {}, child: const Text('Primary')),
            FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')),
          ],
        ),
      ],
    ),
  );
}
