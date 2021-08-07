import 'dart:math';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/util/device_info.dart';
import 'package:penguin_stats_flutter/util/native_window_utils/window_utils.dart';
import 'package:penguin_stats_flutter/util/time_utils.dart';
import 'package:penguin_stats_flutter/commands/commands.dart' as Commands;
import 'package:penguin_stats_flutter/core_packages.dart';
import 'package:penguin_stats_flutter/models/app_model.dart';
import 'package:system_info/system_info.dart';

class BootstrapCommand extends Commands.BaseAppCommand {
  static int kMinBootstrapTimeMs = 2000;

  Future<void> run(BuildContext context) async {
    int startTime = TimeUtils.nowMillis;
    if (Commands.hasContext == false) {
      Commands.setContext(context);
    }
    log("Bootstrap Started, v${AppModel.kVersion}");
    // Load AppModel ASAP
    await appModel.load();
    // Set the cacheSize so we'll use more RAM on desktop and higher spec devices.
    log("BootstrapCommand - Configure memory cache");
    _configureMemoryCache();

    // Once model is loaded, we can configure the desktop.
    if (DeviceOS.isDesktop) {
      log("BootstrapCommand - Configure desktop");
      _configureDesktop();
    }
    // For aesthetics, we'll keep splash screen up for some min-time (skip on web)
    if (kIsWeb == false) {
      int remaining = kMinBootstrapTimeMs - (TimeUtils.nowMillis - startTime);
      if (remaining > 0) {
        print("BootstrapCommand - waiting for $remaining ms");
        await Future<void>.delayed(Duration(milliseconds: remaining));
      }
    }
    appModel.hasBootstrapped = true;
    log("BootstrapCommand - Complete");
  }

  void _configureMemoryCache() {
    // Use more memory by default on desktop
    int cacheSize = (DeviceOS.isDesktop ? 2048 : 512) << 20;
    // If we're on a native platform, reserve some reasonable amt of RAM
    if (DeviceOS.isDesktop) {
      try {
        // Use some percentage of system ram, but don't fall below the default, in case this returns 0 or some other invalid value.
        cacheSize = max(cacheSize, (SysInfo.getTotalPhysicalMemory() / 4).round());
      } on Exception catch (e) {
        log(e.toString());
      }
    }
    imageCache?.maximumSizeBytes = cacheSize;
  }

  void _configureDesktop() {
    // /// Polish (for Windows OS), to hide any movement of the window on startup.
    IoUtils.instance.showWindowWhenReady();
    if (!DeviceOS.isMacOS) {
      IoUtils.instance.setTitle("Flutter Folio");
    }
    Size minSize = Size(600, 700);
    if (kDebugMode) minSize = Size(400, 400);
    DesktopWindow.setMinWindowSize(minSize);
    if (appModel.windowSize.shortestSide > 0) {
      DesktopWindow.setWindowSize(appModel.windowSize);
    }
    // Update the native fileMenu to the initial values
    // RefreshMenuBarCommand().run();
  }
}
