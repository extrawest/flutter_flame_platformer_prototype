import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flame_simple_platformer/model/gameplay.dart';
import 'package:flame_simple_platformer/model/player_data.dart';

class SimplePlatformer extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents, HasTappables {
  late Image spriteSheet;

  final playerData = PlayerData();

  @override
  Future<void>? onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    spriteSheet = await images.load('Spritesheet.png');
    camera.viewport = FixedResolutionViewport(Vector2(640, 330));

    add(GamePlay());

    return super.onLoad();
  }
}
