import 'package:flame/sprite.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/flamegame.dart';
import 'package:flutter/material.dart';

class AgileFly extends Fly {
  AgileFly(FlameGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
