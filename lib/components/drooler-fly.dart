import 'package:flame/sprite.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/flamegame.dart';
import 'package:flutter/material.dart';

class DroolerFly extends Fly {
  DroolerFly(FlameGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}
