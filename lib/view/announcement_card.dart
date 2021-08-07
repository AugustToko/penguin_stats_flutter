import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:penguin_stats_flutter/styles.dart';
import 'package:penguin_stats_flutter/widget/line.dart';
import 'package:penguin_stats_flutter/widget/penguin_card.dart';

// TODO(gikode): 改为动态内容
class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PenguinCard(
      background: Positioned.fill(
        child: Container(
          child: CustomPaint(painter: LinePainter()),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          clipBehavior: Clip.hardEdge,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Icon(LineIcons.infoCircle),
            SizedBox(width: Insets.sm),
            Text(
              '公告',
              style: TextStyles.title1.copyWith(color: Colors.black),
            ),
          ]),
          SizedBox(height: Insets.lg),
          Text('企鹅物流数据统计官方 iOS App 已正式上线！'),
          MaterialButton(
            onPressed: () {},
            child: Text('前往 App Store 下载'),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            elevation: 0,
          ),
          Text('''SideStory「多索雷斯假日」已开放掉落汇报，请注意只有集齐全部标志物时，才可以进行汇报。
本次活动暂不支持截图识别。若您在使用中遇到问题，可通过首页右下的客服系统联系我们。''')
        ],
      ),
    );
  }
}
