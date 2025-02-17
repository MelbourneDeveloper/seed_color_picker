import 'package:flutter/material.dart';
import 'package:seed_color_picker/extensions.dart';

class ColorBox extends StatelessWidget {
  final Color color;
  final String name;

  const ColorBox({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      height: 160,
      width: 160,
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
        child: Text(
          name,
          style: TextStyle(color: contrastColor(color)).copyWith(fontSize: 12),
        ),
      ),
    ),
  );
}
