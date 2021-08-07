import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/util/input_utils.dart';
import 'package:penguin_stats_flutter/core_packages.dart';

import '../../themes.dart';
import 'context_menus/app_context_menu.dart';

class StyledPageScaffold extends StatelessWidget {
  const StyledPageScaffold({Key? key, required this.body, required this.drawer, this.background})
      : super(key: key);
  final Widget body;
  final Widget? background;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    //TODO: Add a FocusTraversalGroup() when this bug is addressed:https://github.com/flutter/flutter/issues/74656
    return GestureDetector(
      onTap: InputUtils.unFocus,
      child: Scaffold(
        backgroundColor: theme.bg1,
        drawer: drawer,
        body: Stack(
          children: [
            ContextMenuRegion(
              child: Container(),
              contextMenu: AppContextMenu(),
            ),
            if (background != null) background!,
            body,
          ],
        ),
      ),
    );
  }
}
