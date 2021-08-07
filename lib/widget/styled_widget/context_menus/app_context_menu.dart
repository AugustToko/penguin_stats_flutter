import 'dart:io';

import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/util/device_info.dart';

class AppContextMenu extends StatefulWidget {
  @override
  _AppContextMenuState createState() => _AppContextMenuState();
}

class _AppContextMenuState extends State<AppContextMenu> with ContextMenuStateMixin {
  @override
  Widget build(BuildContext context) {
    return cardBuilder(
      context,
      [
        if (DeviceOS.isWeb == false) ...[
          buttonBuilder(
              context, ContextMenuButtonConfig("Exit Application", onPressed: () => handlePressed(context, exit(0)))),
        ],
      ],
    );
  }
}
