import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penguin_stats_flutter/widget/penguin_card.dart';

import '../styles.dart';

class GlobalSearchCard extends StatelessWidget {
  const GlobalSearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PenguinCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(child: Icon(LineIcons.search)),
                WidgetSpan(child: SizedBox(width: Insets.sm)),
                TextSpan(
                  text: '全局搜索',
                  style: TextStyles.title1.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(height: Insets.lg),
          SizedBox(
            height: 40,
            child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(Corners.round),
              shadowColor: Colors.black,
              elevation: 4,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8, bottom: 8),
                  hintText: '搜索...',
                ),
              ),
            ),
          ),
          SizedBox(height: Insets.sm),
          Text('键入 物品全拼 拼音首字母 作战名 章节名 关卡编号 或 部分关卡/物品昵称', style: TextStyles.tip)
        ],
      ),
    );
  }
}
