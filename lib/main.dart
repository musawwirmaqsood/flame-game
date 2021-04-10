import 'package:flame/util.dart';
import 'package:flamegame/flamegame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  FlameGame game = FlameGame();
  runApp(game.widget);
}
