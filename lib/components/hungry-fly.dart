import 'package:flame/sprite.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/flamegame.dart';
import 'package:flutter/material.dart';

class HungryFly extends Fly {
  HungryFly(FlameGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}
