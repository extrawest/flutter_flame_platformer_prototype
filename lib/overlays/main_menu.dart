import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/model/gameplay.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  static const id = 'MainMenu';
  final SimplePlatformer gameRef;

  const MainMenu({required this.gameRef, Key? key}) : super(key: key);

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
                  gameRef.add(GamePlay());
                },
                child: const Text('Play'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(width: 150, child: ElevatedButton(onPressed: () {}, child: const Text('Settings'))),
          ],
        ),
      ),
    );
  }
}
