import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/core_packages.dart';
import 'package:penguin_stats_flutter/view/announcement_card.dart';
import 'package:penguin_stats_flutter/view/develop_info_card.dart';
import 'package:penguin_stats_flutter/view/drawer.dart';
import 'package:penguin_stats_flutter/view/global_search_card.dart';
import 'package:penguin_stats_flutter/view/license_card.dart';
import 'package:penguin_stats_flutter/view/quick_start.dart';
import 'package:penguin_stats_flutter/widget/penguin_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StyledPageScaffold(
      drawer: HomePageDrawer(),
      background: Align(
        alignment: Alignment.bottomRight,
        child: Transform(
          transform: Matrix4.translationValues(100, 0, 0),
          child: PenguinBackground(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('home_page'),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '欢迎来到企鹅物流数据统计！',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '企鹅物流数据统计（Penguin Statistics）是企鹅物流旗下数据处理部门（误），致力于明日方舟各素材的掉率统计。\n'
                    '目前绝大部分数据由玩家手动汇报，为了尽量减少谎报、误报对结果的影响，企鹅数据团队会对掉落进行多方位的审查。',
                  ),
                ],
              ),
            ),
          ),
          // TODO(gikode): 各个文本的翻译
          SliverToBoxAdapter(
            child: AnnouncementCard(),
          ),
          SliverToBoxAdapter(
            child: GlobalSearchCard(),
          ),
          SliverToBoxAdapter(
            child: QuickStartCard(),
          ),
          SliverToBoxAdapter(
            child: DevelopInfoCard(),
          ),
          SliverToBoxAdapter(
            child: LicenseCard(),
          ),
        ],
      ),
    );
  }
}
