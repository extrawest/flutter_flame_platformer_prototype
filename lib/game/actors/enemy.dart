import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_simple_platformer/game/actors/player.dart';
import 'package:flame_simple_platformer/game/game.dart';

class Enemy extends SpriteComponent with CollisionCallbacks, HasGameRef<SimplePlatformer> {
  Enemy(
    Image image, {
    Vector2? srcSize,
    Vector2? position,
    Vector2? size,
    Vector2? targetPosition,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,
  }) : super.fromImage(
          image,
          srcPosition: Vector2(32, 0),
          srcSize: Vector2.all(32),
          position: position,
          size: size,
          scale: scale,
          angle: angle,
          anchor: anchor,
          priority: priority,
        ) {
    if (targetPosition != null && position != null) {
      final effect = SequenceEffect(
        [
          MoveToEffect(
            targetPosition,
            EffectController(speed: 200),
            onComplete: () => flipHorizontallyAroundCenter(),
          ),
          MoveToEffect(
            position + Vector2(32, 0),
            EffectController(speed: 200),
            onComplete: () => flipHorizontallyAroundCenter(),
          ),
        ],
        infinite: true,
      );
      add(effect);
    }
  }

  @override
  Future<void>? onLoad() {
    add(CircleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.hit();
      if (gameRef.playerData.health.value > 0) {
        gameRef.playerData.health.value -= 1;
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
