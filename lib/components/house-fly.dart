import 'package:flame/sprite.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/flamegame.dart';

class HouseFly extends Fly {
  HouseFly(FlameGame game, double x, double y) : super(game, x, y) {
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}