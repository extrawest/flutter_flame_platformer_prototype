import 'package:flame/game.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/overlays/gameover_menu.dart';
import 'package:flame_simple_platformer/overlays/main_menu.dart';
import 'package:flame_simple_platformer/overlays/pause_menu.dart';
import 'package:flame_simple_platformer/overlays/settings_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final _game = SimplePlatformer();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: GameWidget<SimplePlatformer>(
          game: kDebugMode ? SimplePlatformer() : _game,
          overlayBuilderMap: {
            MainMenu.id: (context, game) => MainMenu(gameRef: game),
            PauseMenu.id: (context, game) => PauseMenu(gameRef: game),
            GameOverMenu.id: (context, game) => GameOverMenu(gameRef: game),
            SettingsMenu.id: (context, game) => SettingsMenu(gameRef: game),
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}
