import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/overlays/main_menu.dart';
import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  static const id = 'PauseMenu';
  final SimplePlatformer gameRef;

  const PauseMenu({required this.gameRef, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
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
                },
                child: const Text('Resume'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
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
