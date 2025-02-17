import 'package:flutter/material.dart';
import 'package:seed_color_picker/animated_section.dart';

class AnimationShowcase extends StatefulWidget {
  const AnimationShowcase({super.key});

  @override
  State<AnimationShowcase> createState() => _AnimationShowcaseState();
}

class _AnimationShowcaseState extends State<AnimationShowcase>
    with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final AnimationController _rotateController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 8),
      lowerBound: 0,
      upperBound: .1,
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.linear,
    );

    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color Animations', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        AnimatedSection(
          title: 'Pulse Animation (primary & secondary)',
          description:
              'Demonstrates color opacity animation between primary and secondary colors',
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder:
                (context, _) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary.withValues(
                          alpha:
                              ((1 - _pulseAnimation.value) * 0.3 + 0.7) * 255,
                          red: Theme.of(context).colorScheme.secondary.r,
                          green: Theme.of(context).colorScheme.secondary.g,
                          blue: Theme.of(context).colorScheme.secondary.b,
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Pulsing Gradient',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
          ),
        ),

        AnimatedSection(
          title: 'Rotating Gradient (error colors)',
          description: 'Demonstrates a rotating gradient using error colors',
          child: AnimatedBuilder(
            animation: _rotateController,
            builder:
                (context, child) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: SweepGradient(
                      transform: GradientRotation(
                        _rotateController.value * 6.28,
                      ),
                      colors: [
                        Theme.of(context).colorScheme.error,
                        Theme.of(context).colorScheme.errorContainer,
                        Theme.of(context).colorScheme.error,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Rotating Gradient',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ],
    ),
  );
}
