import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

enum DrawerStyle {
  COMMON,
  CARD,
  EXPAND,
}

class DrawerItem {
  final Widget? leading;
  final Text title;
  final Text? subtitle;
  final Widget? trailing;
  final List<DrawerItem> children;
  final DrawerStyle itemStyle;
  final VoidCallback? onTap;

  DrawerItem({
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.itemStyle = DrawerStyle.COMMON,
    this.children = const [],
    this.onTap,
  }) : assert(() {
          if (itemStyle == DrawerStyle.COMMON) {
            return children.isEmpty;
          }
          return true;
        }());

  List<Widget> _genChildren() => children.map((e) => e.toListTile()).toList();

  Widget toListTile() {
    final core = ListTile(
      leading: leading,
      title: title.tr(),
      subtitle: subtitle?.tr(),
      trailing: trailing,
      onTap: onTap,
    );

    switch (itemStyle) {
      case DrawerStyle.COMMON:
        return core;
      case DrawerStyle.CARD:
        return Card(
          clipBehavior: Clip.hardEdge,
          child: core,
        );
      case DrawerStyle.EXPAND:
        return ExpansionTile(
          title: title,
          children: _genChildren(),
        );
    }
  }
}

class HomePageDrawer extends StatelessWidget {
  /// 抽屉列表的 item
  ///
  /// 此处无需显示调用 `tr()` 翻译
  final drawerItemList = <DrawerItem>[
    DrawerItem(
      leading: Icon(Icons.search),
      title: Text('global_search'),
      itemStyle: DrawerStyle.CARD,
    ),
    DrawerItem(
        leading: Icon(Icons.upload),
        title: Text('掉落汇报'),
        itemStyle: DrawerStyle.EXPAND,
        children: [
          DrawerItem(title: Text('按章节'), trailing: Icon(Icons.image))
        ]),
    DrawerItem(
      leading: Icon(Icons.upload),
      title: Text('素材掉率'),
    ),
    DrawerItem(
        leading: Icon(Icons.upload),
        title: Text('刷图规划器'),
        subtitle: Text('ARKPLANNER')),
    DrawerItem(
      leading: Icon(Icons.upload),
      title: Text('高级查询'),
    ),
    DrawerItem(
      leading: Icon(Icons.upload),
      title: Text('全站数据一览'),
    ),
    DrawerItem(
      leading: Icon(Icons.upload),
      title: Text('关于本站'),
    ),
  ];

  // const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetList = drawerItemList.map((e) => e.toListTile()).toList();

    // 抽屉底部操作栏
    widgetList.addAll([
      Divider(),
      ButtonBar(
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.image_rounded),
            label: Text('刷新数据'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.settings),
            label: Text('设置'),
          ),
        ],
      )
    ]);

    return Drawer(
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
