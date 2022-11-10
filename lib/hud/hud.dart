import 'package:flame/components.dart';
import 'package:flame_simple_platformer/game/game.dart';

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
    healthTextComponent.text = 'x${gameRef.playerData.health.value}';
  }
}
