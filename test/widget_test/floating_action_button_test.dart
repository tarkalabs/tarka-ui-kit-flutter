import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarka_ui/tarka_ui.dart';

import '../defaults.dart';

void main() {
  testWidgets("FAB trigger click event", (widgetTester) async {
    bool isClicked = false;
    await widgetTester.pumpWidget(wrapApp(
        child: TUIFloatingActionButton(
      key: const Key("FAB"),
      iconData: FluentIcons.flag_24_filled,
      onPressed: () => {isClicked = true},
    )));
    await widgetTester.tap(find.byKey(const Key("FAB")));
    expect(isClicked, true,
        reason: "FAB click did not trigger onPress callback");
  });
}
