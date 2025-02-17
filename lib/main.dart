import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'
    hide ColorExtension1;

int? hexToInteger(String hex) => int.tryParse(hex, radix: 16);

Color contrastColor(Color color) {
  final Brightness brightness = ThemeData.estimateBrightnessForColor(color);
  return brightness == Brightness.dark ? Colors.white : Colors.black;
}

extension StringColorExtensions on String {
  Color? toColor() {
    var number = hexToInteger(this);
    if (number == null) {
      return null;
    }
    return Color(number);
  }
}

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material Theme Builder',
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

const initialColor = Color(0xFFEE3333);

class _MainPageState extends State<MainPage> {
  final _textEditingController = TextEditingController(text: 'FFEE3333');
  var _seedColor = initialColor;
  bool _isValid = true;
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) => Theme(
    data:
        _brightness == Brightness.light
            ? ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: _seedColor,
                brightness: Brightness.light,
              ),
            )
            : ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: _seedColor,
                brightness: Brightness.dark,
              ),
            ),
    child: DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: setColorScheme,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    prefixIcon:
                        _isValid
                            ? const Icon(Icons.check)
                            : const Icon(Icons.error),
                    suffixIcon: IconButton(
                      icon: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _seedColor,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () => _showColorPicker(context),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter hex color...',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed:
                    () => setState(() {
                      _brightness =
                          _brightness == Brightness.light
                              ? Brightness.dark
                              : Brightness.light;
                    }),
                icon: Icon(
                  _brightness == Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: const [
              Tab(text: 'Colors', icon: Icon(Icons.palette)),
              Tab(text: 'Buttons', icon: Icon(Icons.smart_button)),
              Tab(text: 'Cards', icon: Icon(Icons.credit_card)),
              Tab(text: 'Inputs', icon: Icon(Icons.input)),
              Tab(text: 'Animations', icon: Icon(Icons.animation)),
              Tab(text: 'Lists', icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ColorPalette(seedColor: _seedColor),
            _ButtonShowcase(),
            CardShowcase(),
            InputShowcase(),
            AnimationShowcase(),
            _ListShowcase(),
          ],
        ),
      ),
    ),
  );

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Pick a color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _seedColor,
                onColorChanged: (color) {
                  setState(() {
                    _seedColor = color;
                    _textEditingController.text =
                        '${color.a.round().toRadixString(16).padLeft(2, '0')}'
                                '${color.r.round().toRadixString(16).padLeft(2, '0')}'
                                '${color.g.round().toRadixString(16).padLeft(2, '0')}'
                                '${color.b.round().toRadixString(16).padLeft(2, '0')}'
                            .toUpperCase();
                  });
                },
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Done'),
              ),
            ],
          ),
    );
  }

  void setColorScheme(String t) => setState(() {
    final color = t.toColor();
    _isValid = color != null;
    if (_isValid) _seedColor = color!;
  });
}

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

class ColorBox extends StatelessWidget {
  final Color color;
  final String name;

  const ColorBox({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      height: 160,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(name, style: TextStyle(color: contrastColor(color))),
      ),
    ),
  );
}

class _ButtonShowcase extends StatelessWidget {
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

class AnimationShowcase extends StatefulWidget {
  const AnimationShowcase({super.key});

  @override
  State<AnimationShowcase> createState() => _AnimationShowcaseState();
}

class _AnimationShowcaseState extends State<AnimationShowcase>
    with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final AnimationController _slideController;
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

    _slideController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
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
          title: 'Sliding Animation (tertiary)',
          description: 'Shows a sliding animation with tertiary color',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 100,
              child: AnimatedBuilder(
                animation: _slideController,
                builder:
                    (context, child) => Stack(
                      children: [
                        Positioned(
                          left: _slideController.value * 300 - 100,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(
                                    context,
                                  ).colorScheme.tertiary.withValues(
                                    alpha: 0,
                                    red:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.r,
                                    green:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.g,
                                    blue:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.b,
                                  ),
                                  Theme.of(context).colorScheme.tertiary,
                                  Theme.of(
                                    context,
                                  ).colorScheme.tertiary.withValues(
                                    alpha: 0,
                                    red:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.r,
                                    green:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.g,
                                    blue:
                                        Theme.of(
                                          context,
                                        ).colorScheme.tertiary.b,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          child: Center(
                            child: Text(
                              'Sliding Highlight',
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onTertiaryContainer,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
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

class _ListShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('List Examples', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                title: const Text('Primary Color Avatar'),
                subtitle: const Text('With onPrimary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(color: Theme.of(context).colorScheme.outlineVariant),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                title: const Text('Secondary Color Avatar'),
                subtitle: const Text('With onSecondary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Divider(color: Theme.of(context).colorScheme.outlineVariant),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  child: Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
                title: const Text('Tertiary Color Avatar'),
                subtitle: const Text('With onTertiary icon'),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.inbox,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surface Container Highest',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'With primary color icon',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Surface Background',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'With secondary color icon',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
