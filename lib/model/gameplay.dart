import 'package:flame/components.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/game/level/level.dart';
import 'package:flame_simple_platformer/hud/hud.dart';

class GamePlay extends Component with HasGameRef<SimplePlatformer> {
  Level? _currentLevel;

  final hud = Hud(priority: 1);

  @override
  Future<void>? onLoad() {
    loadLevel('Level1.tmx');
    gameRef.add(hud);
    return super.onLoad();
  }

  @override
  void onRemove() {
    gameRef.remove(hud);
    super.onRemove();
  }

  void loadLevel(String levelName) {
    _currentLevel?.removeFromParent();
    _currentLevel = Level(levelName);
    add(_currentLevel!);
  }
}
