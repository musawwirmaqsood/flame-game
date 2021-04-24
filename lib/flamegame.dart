import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flamegame/components/agile-fly.dart';
import 'package:flamegame/components/backyard.dart';
import 'package:flamegame/components/drooler-fly.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flamegame/components/house-fly.dart';
import 'package:flamegame/components/hungry-fly.dart';
import 'package:flamegame/components/macho-fly.dart';
import 'package:flutter/material.dart';

class FlameGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  bool addFly = false;
  Backyard background;

  FlameGame() {
    initialize();
  }

  void initialize() async {
    flies = [];
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    background = Backyard(this);
    spawnFly();
  }

  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails d) {
    try {
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
        }
      });
    } catch (e) {
      print('onTapDown e: $e');
    }
  }
}
