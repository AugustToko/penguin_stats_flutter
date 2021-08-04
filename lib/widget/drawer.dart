import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:line_icons/line_icons.dart';

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
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          clipBehavior: Clip.hardEdge,
          child: core,
        );
      case DrawerStyle.EXPAND:
        return ExpansionTile(
          title: title,
          leading: leading,
          trailing: trailing,
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
      leading: Icon(LineIcons.search),
      title: Text('global_search'),
      itemStyle: DrawerStyle.CARD,
    ),
    DrawerItem(
      leading: Icon(LineIcons.upload),
      title: Text('掉落汇报'),
      itemStyle: DrawerStyle.EXPAND,
      children: [
        DrawerItem(
          title: Text('按章节'),
          trailing: Icon(LineIcons.mouse),
        ),
        DrawerItem(
          title: Text('截图识别'),
          trailing: Icon(LineIcons.imageFile),
        ),
      ],
    ),
    DrawerItem(
        leading: Icon(LineIcons.pieChart),
        title: Text('素材掉率'),
        itemStyle: DrawerStyle.EXPAND,
        children: [
          DrawerItem(
            title: Text('按作战'),
            trailing: Icon(LineIcons.box),
          ),
          DrawerItem(
            title: Text('按素材'),
            trailing: Icon(LineIcons.inbox),
          ),
        ]),
    DrawerItem(
        leading: Icon(LineIcons.directions),
        title: Text('刷图规划器'),
        subtitle: Text('ARKPLANNER')),
    DrawerItem(
      leading: Icon(LineIcons.database),
      title: Text('高级查询'),
    ),
    DrawerItem(
      leading: Icon(LineIcons.streetView),
      title: Text('全站数据一览'),
    ),
    DrawerItem(
      leading: Icon(LineIcons.infoCircle),
      title: Text('关于本站'),
      itemStyle: DrawerStyle.EXPAND,
      children: [
        DrawerItem(
          title: Text('团队成员'),
          trailing: Icon(LineIcons.dev),
        ),
        DrawerItem(
          title: Text('更新记录'),
          trailing: Icon(LineIcons.info),
        ),
        DrawerItem(
          title: Text('友情链接'),
          trailing: Icon(LineIcons.link),
        ),
        DrawerItem(
          title: Text('内容来源'),
          trailing: Icon(LineIcons.openSourceInitiative),
        ),
      ],
    ),
  ];

  // const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetList = drawerItemList.map((e) => e.toListTile()).toList();

    // 抽屉底部操作栏
    widgetList.addAll([
      const Divider(),
      ButtonBar(
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.refresh),
            label: Text('刷新数据'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(LineIcons.toolbox),
            label: Text('设置'),
          ),
        ],
      )
    ]);

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    widgetList.insert(
      0,
      DrawerHeader(
        padding: EdgeInsets.only(top: statusBarHeight),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.blue),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              UnconstrainedBox(
                child: Placeholder(
                  fallbackHeight: 80,
                  fallbackWidth: 80,
                ),
              ),
              const SizedBox(height: 16),
              Text('企鹅物流数据统计'),
            ],
          ),
        ),
      ),
    );

    return Drawer(
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(children: widgetList),
        ),
      ),
    );
  }
}
