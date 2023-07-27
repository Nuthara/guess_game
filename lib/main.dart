import 'package:flutter/material.dart';
import 'package:guess_game/pages/game_over.dart';
import 'package:guess_game/pages/home_page.dart';
import 'package:guess_game/pages/correct_guess.dart';
import 'package:guess_game/pages/wrong_guess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
