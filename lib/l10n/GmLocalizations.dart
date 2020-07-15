import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class GmLocalizations {
  String get noDescription => null;

  get password => Intl.message("密码", name: "password");

  get passwordRequired =>
      Intl.message('密码不能为空', name: 'password can not be blank');

  static Future<GmLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new GmLocalizations();
    });
  }

  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title => Intl.message('快速开发框架', name: 'title');

  String get language => Intl.message('语言', name: 'language');

  String get setting => Intl.message('设置', name: 'setting');

  String get theme => Intl.message('主题', name: 'theme');

  String get auto => Intl.message('自动', name: 'auto');

  String get login => Intl.message('登录', name: 'login');

  String get logout => Intl.message('退出', name: 'logout');

  String get logoutTip => Intl.message('登录', name: 'logoutTip');

  String get cancel => Intl.message('取消', name: 'cancel');

  String get yes => Intl.message('确定', name: 'yes');

  String get statemanagement => Intl.message('状态管理', name: 'statemanagement');
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    //3
    return GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
