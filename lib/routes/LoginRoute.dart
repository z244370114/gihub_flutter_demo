import 'package:flutter/material.dart';
import 'package:gihubflutter/common/Git.dart';
import 'package:gihubflutter/common/Global.dart';
import 'package:gihubflutter/l10n/GmLocalizations.dart';
import 'package:gihubflutter/models/index.dart';
import 'package:gihubflutter/states/UserModel.dart';
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

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
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
                    labelText: "s",
                    hintText: "1",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : " ";
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
                      onPressed: _onLogin,
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

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      showLoading();
      User user;
      try {
        user = await Git(context)
            .login("z244370114@outlook.com", "zy6189717");
//            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
//          Fluttertoast.showToast(msg: "GmLocalizations");
        } else {
//          Fluttertoast.showToast(msg: e.toString());
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
