import 'package:gihubflutter/models/wusers.dart';

import 'ProfileChangeNotifier.dart';

class WUserModel extends ProfileChangeNotifier {
  Wusers get users => profiles.wuser;

// APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => users != null;

//用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set users(Wusers user) {
    if (users?.data?.username != profiles.wuser?.data?.username) {
      profiles.lastLogin = profiles.wuser?.data?.username;
      profiles.wuser = users;
      notifyListeners();
    }
  }
}
