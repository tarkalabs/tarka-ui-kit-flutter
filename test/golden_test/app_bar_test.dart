import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/tarka_ui.dart';

import '../defaults.dart';
import 'flutter_test_config.dart';

void main() {
  testGoldens('App Bar', (tester) async {
    final appBarWithLabel = buildAppBar([
      TUIAppBarItem(iconData: FluentIcons.bookmark_24_regular, label: "Saved"),
      TUIAppBarItem(iconData: FluentIcons.search_24_regular, label: "Discover"),
      TUIAppBarItem(iconData: FluentIcons.home_24_regular, label: "Home"),
      TUIAppBarItem(iconData: FluentIcons.person_24_regular, label: "Profile"),
      TUIAppBarItem(
          iconData: FluentIcons.settings_24_regular, label: "Settings"),
    ]);

    final appBarWithoutLabel = buildAppBar([
      TUIAppBarItem(iconData: FluentIcons.bookmark_24_regular),
      TUIAppBarItem(iconData: FluentIcons.search_24_regular),
      TUIAppBarItem(iconData: FluentIcons.home_24_regular),
      TUIAppBarItem(iconData: FluentIcons.person_24_regular),
      TUIAppBarItem(iconData: FluentIcons.settings_24_regular),
    ]);
    final builder = goldenColumnBuilder();
    builder.addScenario("With Label", appBarWithLabel);
    builder.addScenario("Without Label", appBarWithoutLabel);
    await tester.pumpWidgetBuilder(builder.build(), wrapper: tuiAppWrapper());
    await screenMatchesGolden(
        tester, 'app_bar_all_types');
  });
}

TUIAppBar buildAppBar(List<TUIAppBarItem> items) {
  return TUIAppBar(
    items: items,
    currentIndex: 2,
    onTap: (value) => {},
  );
}
