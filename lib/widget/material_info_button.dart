import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/core_packages.dart';

class StyledInfoButton extends StatelessWidget {
  const StyledInfoButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.background,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget icon;
  final Widget title;
  final Widget subTitle;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return MaterialInfoButton(
      onTap: onTap,
      backgroundIcon: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            icon,
            SizedBox(height: Insets.sm),
            title,
            SizedBox(height: Insets.sm),
            subTitle
          ],
        ),
      ),
    );
  }
}

/// 对 [MaterialButton] 的一种包装
// TODO(gikode): 为元素添加过渡动画
// TODO(gikode): 为 desktop 添加鼠标 hover 动画
class MaterialInfoButton extends StatelessWidget {
  const MaterialInfoButton({
    Key? key,
    required this.onTap,
    this.backgroundIcon,
    required this.body,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget body;
  final Widget? backgroundIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: Elevation.sm,
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(Insets.sm),
            child: body,
          ),
          if (backgroundIcon != null)
            Positioned(
              right: 1,
              bottom: -30,
              child: IconTheme(
                data: IconThemeData(
                  color: Colors.black.withOpacity(0.05),
                  size: 100,
                ),
                child: backgroundIcon!,
              ),
            )
        ],
      ),
    );
  }
}
