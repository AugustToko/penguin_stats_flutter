import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penguin_stats_flutter/core_packages.dart';
import 'package:penguin_stats_flutter/main_app_scaffold.dart';
import 'package:penguin_stats_flutter/page/home_page.dart';
import 'package:penguin_stats_flutter/util/device_info.dart';

import 'commands/app/bootstrap_command.dart';
import 'models/app_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  initLogger(() async {
    // Status bar style on Android/iOS
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());

    if (DeviceOS.isWeb) {
      // Increase Skia cache size to support bigger images.
      const int megabyte = 1000000;
      await SystemChannels.skia
          .invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
    }

    AppModel appModel = AppModel();

    runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
      ],
      child: MultiProvider(
        providers: [
          // App Model - Stores data related to global settings or app modes
          ChangeNotifierProvider.value(value: appModel),
        ],
        child: MyApp(),
      ),
    ));
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Run Bootstrap with scheduleMicrotask to avoid triggering any builds from init(), which would throw an error.
    scheduleMicrotask(() {
      // Bootstrap. This will initialize services, load saved data, determine initial navigation state and anything else that needs to get done at startup
      BootstrapCommand().run(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.select((AppModel m) => m.theme);
    ThemeData materialTheme = theme.toThemeData();
    bool enableTouchMode = context.select((AppModel m) => m.enableTouchMode);
    double density = enableTouchMode ? 0 : -1;
    print("enableTouchMode: $enableTouchMode");
    materialTheme = ThemeData(
      visualDensity: VisualDensity(horizontal: density, vertical: density),
    );

    return MaterialApp(
      title: 'Penguin Stats Flutter',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: materialTheme,
      home: MainAppScaffold(showAppBar: false, child: HomePage()),
    );
  }
}
