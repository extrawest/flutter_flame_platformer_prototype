import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/overlays/main_menu.dart';
import 'package:flame_simple_platformer/utils/audio_manager.dart';
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
                  AudioManager.resumeBgm();
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
                  AudioManager.stopBgm();
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
