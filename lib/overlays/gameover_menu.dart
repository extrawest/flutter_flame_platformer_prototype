import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/model/gameplay.dart';
import 'package:flutter/material.dart';

import 'main_menu.dart';

class GameOverMenu extends StatelessWidget {
  static const id = 'GameOverMenu';
  final SimplePlatformer gameRef;

  const GameOverMenu({required this.gameRef, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                  gameRef.removeAll(gameRef.children);
                  gameRef.add(GamePlay());
                },
                child: const Text('Restart'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                  gameRef.removeAll(gameRef.children);
                  gameRef.overlays.add(MainMenu.id);
                },
                child: const Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
