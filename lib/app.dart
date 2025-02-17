import 'package:flutter/material.dart';
import 'package:seed_color_picker/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material Theme Builder',
    home: MainPage(),
  );
}
