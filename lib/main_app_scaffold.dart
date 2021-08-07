import 'package:anchored_popups/anchored_popups.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:penguin_stats_flutter/widget/decorated_container.dart';
import 'package:penguin_stats_flutter/commands/commands.dart' as Commands;
import 'package:penguin_stats_flutter/core_packages.dart';
import 'package:penguin_stats_flutter/models/app_model.dart';
import 'package:penguin_stats_flutter/widget/styled_widget/context_menus/styled_context_menu_overlay.dart';

/// Wraps the entire app, providing it with various helper classes and wrapper widgets.
class MainAppScaffold extends StatefulWidget {
  const MainAppScaffold({
    Key? key,
    required this.showAppBar,
    required this.child,
  }) : super(key: key);
  final bool showAppBar;
  final Widget child;

  @override
  _MainAppScaffoldState createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffold>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TextDirection textDirection =
        context.select((AppModel app) => app.textDirection);
    // Provide the appTheme directly to the tree, so views don't need to look it up on the model (less boilerplate for views)
    AppTheme appTheme = context.select((AppModel app) => app.theme);
    return Provider.value(
      value: appTheme,
      child: Directionality(
        textDirection: textDirection,
        // TODO: Log a bug on the backspace issue that requires this wrapper
        child: Navigator(
          onPopPage: (_, __) => false,
          pages: [
            MaterialPage(
              // Right-click support
              child: StyledContextMenuOverlay(
                // Tooltip and popup panel support
                child: AnchoredPopups(
                  //TODO: Try and remove this navigator + page + builder
                  child: Navigator(
                    onPopPage: (Route route, result) {
                      if (route.didPop(result)) return true;
                      return false;
                    },
                    pages: [
                      MaterialPage(
                        // Pop-over (tooltip) support
                        child: Builder(
                          builder: (BuildContext builderContext) {
                            /// User a builder to provide a context to the Command layer that can show dialogs, bottom sheets etc
                            Commands.setContext(builderContext);
                            return _WindowBorder(
                              color: appTheme.greyStrong,
                              // Supply a top-level scaffold and SafeArea for all views
                              child: Scaffold(
                                backgroundColor: appTheme.surface1,
                                body: Stack(
                                  clipBehavior: Clip.antiAlias,
                                  children: [
                                    SafeArea(
                                      top: false,
                                      // AppBar + Content
                                      child: Column(
                                        // This column has a reversed vertical direction, because we want the TitleBar to cast a shadow on the content below it.
                                        verticalDirection: VerticalDirection.up,
                                        children: [
                                          // Bottom content area
                                          Expanded(child: widget.child),
                                          // Top-aligned TitleBar
                                          if (widget.showAppBar)
                                            Container(
                                              child: Text('AppBar'),
                                              width: 100,
                                              height: 100,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _WindowBorder extends StatelessWidget {
  const _WindowBorder({Key? key, required this.child, required this.color})
      : super(key: key);
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      DecoratedContainer(
          ignorePointer: true,
          borderColor: Colors.white.withOpacity(.1),
          borderWidth: 1),
    ]);
  }
}
