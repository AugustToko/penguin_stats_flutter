import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penguin_stats_flutter/core_packages.dart';
import 'package:penguin_stats_flutter/widget/material_info_button.dart';
import 'package:penguin_stats_flutter/widget/penguin_card.dart';

class QuickStartCard extends StatelessWidget {
  const QuickStartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PenguinCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Icon(Icons.forward),
            SizedBox(width: Insets.sm),
            Text(
              '快速上手',
              style: TextStyles.title1.copyWith(color: Colors.black),
            ),
          ]),
          SizedBox(height: Insets.med),
          Text.rich(
            TextSpan(
              text: '点击左上角 ',
              children: [
                WidgetSpan(child: Icon(Icons.menu)),
                TextSpan(text: ' 按钮展开菜单以查看更多功能')
              ],
            ),
          ),
          SizedBox(height: Insets.med),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                StyledInfoButton(
                  onTap: () {},
                  icon: Icon(LineIcons.dev, size: 36),
                  title: Text.rich(
                    TextSpan(
                      text: '开发者中心',
                      children: [
                        WidgetSpan(child: SizedBox(width: Insets.sm)),
                        WidgetSpan(child: Icon(LineIcons.link)),
                      ],
                      style: TextStyles.h3,
                    ),
                  ),
                  subTitle: Text(' 我要汇报掉落 ', style: TextStyles.tip),
                  background: Icon(LineIcons.dev),
                ),
                StyledInfoButton(
                  onTap: () {},
                  icon: Icon(LineIcons.dev, size: 36),
                  title: Text.rich(
                    TextSpan(
                      text: '开发者中心',
                      children: [
                        WidgetSpan(child: SizedBox(width: Insets.sm)),
                        WidgetSpan(child: Icon(LineIcons.link)),
                      ],
                      style: TextStyles.h3,
                    ),
                  ),
                  subTitle: Text(' 我要汇报掉落 ', style: TextStyles.tip),
                  background: Icon(LineIcons.dev),
                ),
                StyledInfoButton(
                  onTap: () {},
                  icon: Icon(LineIcons.dev, size: 36),
                  title: Text.rich(
                    TextSpan(
                      text: '开发者中心',
                      children: [
                        WidgetSpan(child: SizedBox(width: Insets.sm)),
                        WidgetSpan(child: Icon(LineIcons.link)),
                      ],
                      style: TextStyles.h3,
                    ),
                  ),
                  subTitle: Text(' 我要汇报掉落 ', style: TextStyles.tip),
                  background: Icon(LineIcons.dev),
                ),
                StyledInfoButton(
                  onTap: () {},
                  icon: Icon(LineIcons.dev, size: 36),
                  title: Text.rich(
                    TextSpan(
                      text: '开发者中心',
                      children: [
                        WidgetSpan(child: SizedBox(width: Insets.sm)),
                        WidgetSpan(child: Icon(LineIcons.link)),
                      ],
                      style: TextStyles.h3,
                    ),
                  ),
                  subTitle: Text(' 我要汇报掉落 ', style: TextStyles.tip),
                  background: Icon(LineIcons.dev),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
