import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:penguin_stats_flutter/styles.dart';
import 'package:penguin_stats_flutter/widget/penguin_card.dart';

class LicenseCard extends StatelessWidget {
  const LicenseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PenguinCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Text(
              '许可协议',
              style: TextStyles.title1.copyWith(color: Colors.black),
            ),
            SizedBox(width: Insets.sm),
            // TODO(gikode): flutter_svg...
            SvgPicture.asset('assets/images/license_icon.svg', width: 60)
          ]),
          SizedBox(height: Insets.lg),
          Text('''素材掉落统计数据由企鹅物流统计，采用知识共享 署名-非商业性使用 4.0 国际 许可协议进行许可。
转载、公开或以任何形式复制、发行、再传播本站任何内容时，必须注明从企鹅物流数据统计转载，并提供版权标识、许可协议标识、免责标识和作品链接；
且未经许可，不得将本站内容或由其衍生作品用于商业目的。'''),
          SizedBox(height: Insets.sm),
          OutlinedButton.icon(
            onPressed: () {},
            label: Text('详细信息'),
            icon: Icon(Icons.open_in_browser),
          ),
        ],
      ),
    );
  }
}
