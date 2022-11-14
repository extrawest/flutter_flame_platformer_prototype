import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_simple_platformer/game/game.dart';
import 'package:flame_simple_platformer/overlays/gameover_menu.dart';
import 'package:flame_simple_platformer/overlays/pause_menu.dart';
import 'package:flame_simple_platformer/utils/audio_manager.dart';

class Hud extends Component with HasGameRef<SimplePlatformer> {
  late final TextComponent scoreTextComponent;
  late final TextComponent healthTextComponent;

  Hud({super.children, super.priority}) {
    positionType = PositionType.viewport;
  }

  @override
  Future<void>? onLoad() {
    scoreTextComponent = TextComponent(
      text: 'Score: 0',
      position: Vector2(10, 10),
    );
    add(scoreTextComponent);

    healthTextComponent = TextComponent(
      text: 'x5',
      anchor: Anchor.topRight,
      position: Vector2(gameRef.size.x - 10, 10),
    );
    add(healthTextComponent);

    final playerSprite = SpriteComponent.fromImage(gameRef.spriteSheet,
        srcPosition: Vector2.zero(),
        srcSize: Vector2.all(32),
        anchor: Anchor.topRight,
        position: Vector2(healthTextComponent.position.x - healthTextComponent.size.x - 5, 5));
    add(playerSprite);

    gameRef.playerData.score.addListener(onScoreChanged);

    gameRef.playerData.health.addListener(onHealthChanged);

    final pauseButton = SpriteButtonComponent(
      button: Sprite(gameRef.spriteSheet, srcSize: Vector2.all(32), srcPosition: Vector2(32 * 4, 0)),
      size: Vector2.all(32),
      position: Vector2(gameRef.size.x / 2, 0),
      anchor: Anchor.topCenter,
      onPressed: () {
        AudioManager.pauseBgm();
        gameRef.pauseEngine();
        gameRef.overlays.add(PauseMenu.id);
      },
    )..positionType = PositionType.viewport;
    add(pauseButton);

    return super.onLoad();
  }

  @override
  void onRemove() {
    gameRef.playerData.score.removeListener(onScoreChanged);
    gameRef.playerData.score.removeListener(onHealthChanged);
    super.onRemove();
  }

  void onScoreChanged() {
    scoreTextComponent.text = 'Score: ${gameRef.playerData.score.value}';
  }

  void onHealthChanged() {
    final healthValue = gameRef.playerData.health.value;
    healthTextComponent.text = 'x$healthValue';

    if (healthValue == 0) {
      AudioManager.stopBgm();
      gameRef.pauseEngine();
      gameRef.overlays.add(GameOverMenu.id);
    }
  }
}
