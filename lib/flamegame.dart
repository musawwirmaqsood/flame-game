import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flamegame/components/fly.dart';
import 'package:flutter/material.dart';

class FlameGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;

  FlameGame() {
    initialize();
  }

  void initialize() async {
    flies = [];
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    spawnFly();
  }

  void render(Canvas canvas) {
    // draw a black background on the whole screen
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    // // draw a box (make it green if won, white otherwise)
    // double screenCenterX = screenSize.width / 2;
    // double screenCenterY = screenSize.height / 2;
    // Rect boxRect = Rect.fromLTWH(
    //   screenCenterX - 75,
    //   screenCenterY - 75,
    //   150,
    //   150,
    // );
    // Paint boxPaint = Paint();
    // canvas.drawRect(boxRect, boxPaint);
    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
  }

  void onTapDown(TapDownDetails d) {
    print("Player tap down on ${d.globalPosition.dx} - ${d.globalPosition.dy}");
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
