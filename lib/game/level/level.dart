import 'package:flame/components.dart';
import 'package:flame_simple_platformer/game/actors/coin.dart';
import 'package:flame_simple_platformer/game/actors/door.dart';
import 'package:flame_simple_platformer/game/actors/enemy.dart';
import 'package:flame_simple_platformer/game/actors/platform.dart';
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

    _spawnActors(level.tileMap);

    return super.onLoad();
  }

  void _spawnActors(RenderableTiledMap tileMap) {
    final platformsLayer = tileMap.getObjectGroupFromLayer('Platforms');

    for (final platformObject in platformsLayer.objects) {
      final platform = Platform(
        position: Vector2(platformObject.x, platformObject.y),
        size: Vector2(
          platformObject.width,
          platformObject.height,
        ),
      );
      add(platform);
    }

    final spawnPointsLayer = tileMap.getObjectGroupFromLayer('SpawnPoints');

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
        case 'Coin':
          final coin = Coin(
            gameRef.spriteSheet,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(coin);
          break;
        case 'Enemy':
          final enemy = Enemy(
            gameRef.spriteSheet,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(enemy);
          break;
        case 'Door':
          final door = Door(
            gameRef.spriteSheet,
            position: Vector2(spawnPoint.x, spawnPoint.y),
            size: Vector2(spawnPoint.width, spawnPoint.height),
          );
          add(door);
      }
    }
  }
}
