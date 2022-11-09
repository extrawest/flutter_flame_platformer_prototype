import 'package:flame/game.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final _game = SimplePlatfomer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: GameWidget(game: kDebugMode ? SimplePlatfomer() : _game)),
    );
  }
}
