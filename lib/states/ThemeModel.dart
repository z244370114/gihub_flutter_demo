import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gihubflutter/common/Global.dart';

import 'ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier {
  // 获取当前主题，如果为设置主题，则默认使用蓝色主题
  ColorSwatch get theme => Global.themes
      .firstWhere((e) => e.value == profiles.theme, orElse: () => Colors.blue);

  // 主题改变后，通知其依赖项，新主题会立即生效
  set theme(ColorSwatch color) {
    if (color != theme) {
      profiles.theme = color[500].value;
      notifyListeners();
    }
  }
}
