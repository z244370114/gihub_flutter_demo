
import 'package:gihubflutter/models/user.dart';

import 'ProfileChangeNotifier.dart';

class UserModel extends ProfileChangeNotifier {
  User get user => profiles.user;

// APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

//用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User user) {
    if (user?.login != profiles.user?.login) {
      profiles.lastLogin = profiles.user?.login;
      profiles.user = user;
      notifyListeners();
    }
  }
}
