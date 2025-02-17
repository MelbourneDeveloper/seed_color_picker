import 'package:flutter/material.dart';
import 'package:seed_color_picker/color_box.dart';

class ColorPalette extends StatelessWidget {
  final Color seedColor;

  const ColorPalette({super.key, required this.seedColor});

  @override
  Widget build(BuildContext context) => Wrap(
    children: [
      ColorBox(color: seedColor, name: 'seed'),
      ColorBox(color: Theme.of(context).colorScheme.primary, name: 'primary'),
      ColorBox(
        color: Theme.of(context).colorScheme.errorContainer,
        name: 'errorContainer',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.inversePrimary,
        name: 'inversePrimary',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.inverseSurface,
        name: 'inverseSurface',
      ),
      ColorBox(color: Theme.of(context).colorScheme.error, name: 'error'),
      ColorBox(color: Theme.of(context).colorScheme.onError, name: 'onError'),
      ColorBox(
        color: Theme.of(context).colorScheme.onErrorContainer,
        name: 'onErrorContainer',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onInverseSurface,
        name: 'onInverseSurface',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onPrimary,
        name: 'onPrimary',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onSecondary,
        name: 'onSecondary',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        name: 'onSecondaryContainer',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onSurface,
        name: 'onSurface',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        name: 'onSurfaceVariant',
      ),
      ColorBox(color: Theme.of(context).colorScheme.tertiary, name: 'tertiary'),
      ColorBox(
        color: Theme.of(context).colorScheme.onTertiary,
        name: 'onTertiary',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        name: 'onTertiaryContainer',
      ),
      ColorBox(color: Theme.of(context).colorScheme.scrim, name: 'scrim'),
      ColorBox(color: Theme.of(context).colorScheme.outline, name: 'outline'),
      ColorBox(
        color: Theme.of(context).colorScheme.outlineVariant,
        name: 'outlineVariant',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        name: 'surfaceContainerHighest',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        name: 'surfaceContainerHigh',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        name: 'surfaceContainer',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        name: 'surfaceContainerLow',
      ),
      ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        name: 'surfaceContainerLowest',
      ),
      ColorBox(color: Theme.of(context).colorScheme.shadow, name: 'shadow'),
    ],
  );
}
