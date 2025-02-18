import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:seed_color_picker/animation_showcase.dart';
import 'package:seed_color_picker/button_showcase.dart';
import 'package:seed_color_picker/card_showcase.dart';
import 'package:seed_color_picker/color_palette.dart';
import 'package:seed_color_picker/extensions.dart';
import 'package:seed_color_picker/input_showcase.dart';
import 'package:seed_color_picker/list_showcase.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

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
              colorScheme: ColorScheme.fromSeed(
                seedColor: _seedColor,
                brightness: Brightness.light,
              ),
            )
            : ThemeData(
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
            ButtonShowcase(),
            CardShowcase(),
            InputShowcase(),
            AnimationShowcase(),
            ListShowcase(),
          ],
        ),
      ),
    ),
  );

  void _showColorPicker(BuildContext context) {
    showModalBottomSheet(
      elevation: 3,
      context: context,
      barrierColor: Colors.transparent,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      builder:
          (context) => SizedBox(
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 300,

                    child: ColorPicker(
                      enableAlpha: true,
                      portraitOnly: true,
                      pickerColor: _seedColor,
                      onColorChanged: (color) {
                        setState(() {
                          _seedColor = color;
                          _textEditingController.text = color.toHexString();
                        });
                      },
                      pickerAreaHeightPercent: 0.8,
                      hexInputBar: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }

  void setColorScheme(String t) => setState(() {
    final color = ColorExtension1(t).toColor();
    _isValid = color != null;
    if (_isValid) _seedColor = color!;
  });
}


