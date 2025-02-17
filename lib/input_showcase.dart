import 'package:flutter/material.dart';

class InputShowcase extends StatelessWidget {
  const InputShowcase({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Text Fields', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Outlined TextField',
            hintText: 'Enter text...',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Filled TextField',
            hintText: 'Enter text...',
            filled: true,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Switches & Checkboxes',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Switch(value: true, onChanged: (_) {}),
            Checkbox(value: true, onChanged: (_) {}),
            Radio(value: true, groupValue: true, onChanged: (_) {}),
          ],
        ),
      ],
    ),
  );
}
