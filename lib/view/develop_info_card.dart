import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penguin_stats_flutter/styles.dart';
import 'package:penguin_stats_flutter/widget/material_info_button.dart';
import 'package:penguin_stats_flutter/widget/penguin_card.dart';

class DevelopInfoCard extends StatelessWidget {
  const DevelopInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PenguinCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '参与开发',
            style: TextStyles.title1.copyWith(color: Colors.black),
          ),
          SizedBox(height: Insets.sm),
          Text('* 本项目为无偿开源项目', style: TextStyles.tip),
          SizedBox(height: Insets.sm),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(Corners.lg),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(LineIcons.github),
                  label: Text('前端'),
                ),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(LineIcons.github),
                  label: Text('后端'),
                ),
              ],
            ),
          ),
          SizedBox(height: Insets.sm),
          Text('如果您有以下一项或多项经验，愿意为企鹅数据贡献自己的一份力量，欢迎联系我们。'),
          SizedBox(height: Insets.sm),
          Text('''· QQ群：747099627
· 网站前端开发（Vue.js）
· 网站后端开发（Java Spring Boot、MongoDB、Golang）
· 移动端 App 开发（iOS、Android）
· 网站运维
· UI/UX设计
· 数据统计分析''', style: TextStyles.body2),
          SizedBox(height: Insets.sm),
          const Divider(),
          SizedBox(height: Insets.sm),
          Center(
            child: Container(
              width: double.infinity,
              height: 118,
              child: MaterialInfoButton(
                onTap: () {},
                body: Column(
                  children: [
                    Icon(LineIcons.dev, size: 48),
                    SizedBox(height: Insets.sm),
                    Text.rich(
                      TextSpan(
                        text: '开发者中心',
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: Insets.sm),
                          ),
                          WidgetSpan(child: Icon(LineIcons.link)),
                        ],
                        style: TextStyles.h2,
                      ),
                    ),
                    SizedBox(height: Insets.sm),
                    Text(
                      ' 在企鹅物流数据统计基础上开发用的 API 文档等资源 ',
                      style: TextStyles.tip,
                    )
                  ],
                ),
                backgroundIcon: Icon(LineIcons.dev),
              ),
            ),
          )
        ],
      ),
    );
  }
}
