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
    home: MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const initialColor = Color(0xFFEE3333);

class _MyHomePageState extends State<MyHomePage> {
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
      length: 4,
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
            tabAlignment: TabAlignment.fill,
            tabs: const [
              Tab(text: 'Colors', icon: Icon(Icons.palette)),
              Tab(text: 'Buttons', icon: Icon(Icons.smart_button)),
              Tab(text: 'Cards', icon: Icon(Icons.credit_card)),
              Tab(text: 'Inputs', icon: Icon(Icons.input)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ColorPalette(seedColor: _seedColor),
            _ButtonShowcase(),
            _CardShowcase(),
            _InputShowcase(),
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

class _ColorPalette extends StatelessWidget {
  final Color seedColor;

  const _ColorPalette({required this.seedColor});

  @override
  Widget build(BuildContext context) => Wrap(
    children: [
      _ColorBox(color: seedColor, name: 'seed'),
      _ColorBox(color: Theme.of(context).colorScheme.primary, name: 'primary'),
      _ColorBox(
        color: Theme.of(context).colorScheme.errorContainer,
        name: 'errorContainer',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.inversePrimary,
        name: 'inversePrimary',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.inverseSurface,
        name: 'inverseSurface',
      ),
      _ColorBox(color: Theme.of(context).colorScheme.error, name: 'error'),
      _ColorBox(color: Theme.of(context).colorScheme.onError, name: 'onError'),
      _ColorBox(
        color: Theme.of(context).colorScheme.onErrorContainer,
        name: 'onErrorContainer',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onInverseSurface,
        name: 'onInverseSurface',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onPrimary,
        name: 'onPrimary',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onSecondary,
        name: 'onSecondary',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        name: 'onSecondaryContainer',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onSurface,
        name: 'onSurface',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        name: 'onSurfaceVariant',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.tertiary,
        name: 'tertiary',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onTertiary,
        name: 'onTertiary',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        name: 'onTertiaryContainer',
      ),
      _ColorBox(color: Theme.of(context).colorScheme.scrim, name: 'scrim'),
      _ColorBox(color: Theme.of(context).colorScheme.outline, name: 'outline'),
      _ColorBox(
        color: Theme.of(context).colorScheme.outlineVariant,
        name: 'outlineVariant',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        name: 'surfaceContainerHighest',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        name: 'surfaceContainerHigh',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainer,
        name: 'surfaceContainer',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        name: 'surfaceContainerLow',
      ),
      _ColorBox(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        name: 'surfaceContainerLowest',
      ),
      _ColorBox(color: Theme.of(context).colorScheme.shadow, name: 'shadow'),
    ],
  );
}

class _ColorBox extends StatelessWidget {
  final Color color;
  final String name;

  const _ColorBox({required this.color, required this.name});

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

class _CardShowcase extends StatelessWidget {
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

class _InputShowcase extends StatelessWidget {
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
