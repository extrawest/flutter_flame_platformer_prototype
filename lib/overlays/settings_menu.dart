import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/overlays/main_menu.dart';
import 'package:flame_simple_platformer/utils/audio_manager.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  static const id = 'SettingsMenu';
  final SimplePlatformer gameRef;

  const SettingsMenu({required this.gameRef, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioManager.sfx,
                builder: (context, sfx, child) => SwitchListTile(
                  title: const Text('Sound Effects'),
                  value: sfx,
                  onChanged: (value) => AudioManager.sfx.value = value,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ValueListenableBuilder<bool>(
                valueListenable: AudioManager.bgm,
                builder: (context, bgm, child) => SwitchListTile(
                  title: const Text('Background Music'),
                  value: bgm,
                  onChanged: (value) => AudioManager.bgm.value = value,
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text('Back'),
                onPressed: () {
                  gameRef.overlays.remove(id);
                  gameRef.overlays.add(MainMenu.id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
