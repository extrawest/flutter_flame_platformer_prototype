import 'package:flame/game.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//TODO: use this in GameWidget
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
      home: Scaffold(body: GameWidget(game: SimplePlatfomer())),
    );
  }
}
