import 'package:flame/sprite.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/flamegame.dart';
import 'package:flutter/material.dart';

class MachoFly extends Fly {
  MachoFly(FlameGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprite = [];
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}
