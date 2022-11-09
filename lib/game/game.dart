import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_simple_platformer/game/level/level.dart';

class SimplePlatfomer extends FlameGame {
  Level? _currentLevel;
  late Image spriteSheet;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    spriteSheet = await images.load('Spritesheet.png');
    camera.viewport = FixedResolutionViewport(Vector2(640, 330));

    loadLevel('Level1.tmx');
    return super.onLoad();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
