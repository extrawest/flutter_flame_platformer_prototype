import 'package:flame/components.dart';
import 'package:flame_simple_platformer/game/actors/player.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends Component with HasGameRef<SimplePlatfomer> {
  final String levelName;

  Level(this.levelName) : super();

  @override
  Future<void>? onLoad() async {
    final level = await TiledComponent.load(levelName, Vector2.all(32));
    add(level);

    final spawnPointsLayer = level.tileMap.getObjectGroupFromLayer('SpawnPoints');

    for (final spawnPoint in spawnPointsLayer.objects) {
      switch (spawnPoint.name) {
        case 'Player':
          final player = Player(
            gameRef.spriteSheet,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(player);
          break;
      }
    }

    return super.onLoad();
  }
}
