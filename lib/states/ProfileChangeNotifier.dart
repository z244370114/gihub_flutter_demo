import 'package:flutter/widgets.dart';
import 'package:gihubflutter/common/Global.dart';
import 'package:gihubflutter/models/profile.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get profiles => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
