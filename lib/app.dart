import 'package:flutter/material.dart';
import 'package:seed_color_picker/main_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material Design Seed Picker',
    home: MainPage(),
  );
}
