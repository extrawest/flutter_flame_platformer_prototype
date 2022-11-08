import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_simple_platformer/game/level/level.dart';
import 'package:flame_tiled/flame_tiled.dart';

class SimplePlatfomer extends FlameGame {
  Level? _currentLevel;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();
    camera.viewport = FixedResolutionViewport(Vector2(640, 330));

    loadLevel('Level2.tmx');
    return super.onLoad();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
