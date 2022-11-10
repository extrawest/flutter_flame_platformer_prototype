import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_simple_platformer/game/level/level.dart';
import 'package:flame_simple_platformer/hud/hud.dart';

class SimplePlatformer extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  Level? _currentLevel;
  late Image spriteSheet;

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    spriteSheet = await images.load('Spritesheet.png');
    camera.viewport = FixedResolutionViewport(Vector2(640, 330));

    loadLevel('Level1.tmx');
    add(Hud(priority: 1));

    return super.onLoad();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
