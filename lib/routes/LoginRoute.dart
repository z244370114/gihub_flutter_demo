import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gihubflutter/common/Git.dart';
import 'package:gihubflutter/common/Global.dart';
import 'package:gihubflutter/l10n/GmLocalizations.dart';
import 'package:gihubflutter/models/index.dart';
import 'package:gihubflutter/states/UserModel.dart';
import 'package:gihubflutter/states/WUserModel.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginRoutePage();
  }
}

class LoginRoutePage extends StatefulWidget {
  @override
  _LoginRoutePageState createState() => _LoginRoutePageState();
}

class _LoginRoutePageState extends State<LoginRoutePage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;
  FlutterToast flutterToast;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
//    _unameController.text = "z244370114@outlook.com";
//    _pwdController.text = "zy6189717";
    _unameController.text = "zy123456789";
    _pwdController.text = "123456789";
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
    flutterToast = FlutterToast(context);
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(GmLocalizations.of(context).login),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: gm.username,
                    hintText: gm.username,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : gm.userRequired;
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  autofocus: !_nameAutoFocus,
                  decoration: InputDecoration(
                      labelText: gm.password,
                      hintText: gm.password,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        },
                      )),
                  obscureText: !pwdShow,
                  //校验密码（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : gm.passwordRequired;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: _onLogins,
                      textColor: Colors.white,
                      child: Text(gm.login),
                    ),
                  ),
                ),
              ],
            ),
            key: _formKey,
            autovalidate: true,
          ),
        ));
  }

  ///玩安卓 登录API
  void _onLogins() async {
    if ((_formKey.currentState as FormState).validate()) {
      showLoading();
      Wusers wusers;
      try {
        wusers = await Git(context)
            .logins(_unameController.text, _pwdController.text);
        if (wusers.errorCode == 0) {
          Provider.of<WUserModel>(context, listen: false).users = wusers;
        } else {
          _showToast(wusers.errorMsg);
        }
      } catch (e) {
        _showToast(e.toString());
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      if (wusers != null) {
        // 返回
        Navigator.of(context).pop();
      }
    }
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
//      showLoading();
      User user;
      try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
          _showToast("登录失败");
        } else {
          _showToast(e.toString());
        }
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      if (user != null) {
        // 返回
        Navigator.of(context).pop();
      }
    }
  }

  var bottom = ToastGravity.BOTTOM;

  _showToast(String content) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(content),
        ],
      ),
    );

    flutterToast.showToast(
      child: toast,
      gravity: bottom,
      toastDuration: Duration(seconds: 2),
    );
  }

  showLoading() {
    showDialog(
      context: context,
      barrierDismissible: true, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
