import 'package:flutter/material.dart';
import 'package:gihubflutter/common/Global.dart';
import 'package:gihubflutter/l10n/GmLocalizations.dart';
import 'package:gihubflutter/states/ThemeModel.dart';
import 'package:provider/provider.dart';

class ThemeChangeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeChangeRoutePage();
  }
}

class ThemeChangeRoutePage extends StatefulWidget {
  @override
  _ThemeChangeRoutePageState createState() => _ThemeChangeRoutePageState();
}

class _ThemeChangeRoutePageState extends State<ThemeChangeRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context).theme),
      ),
      body: ListView(
        //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeModel>(context,listen: false).theme = e;
              print("我点击了切换主题颜色栏");
            },
          );
        }).toList(),
      ),
    );
  }
}
