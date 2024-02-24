import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/tarka_ui.dart';

import '../defaults.dart';

void main() {
  testWidgets("Icon Button trigger click event", (widgetTester) async {
    bool isClicked = false;
    await widgetTester.pumpWidget(wrapApp(
        child: TUIIconButton(
      type: TUIIconButtonType.primary,
      size: TUIIconButtonSize.px48,
      key: const Key("IconButton"),
      iconData: FluentIcons.flag_24_filled,
      onPressed: () => {isClicked = true},
    )));
    await widgetTester.tap(find.byKey(const Key("IconButton")));
    expect(isClicked, true,
        reason: "Icon Button click did not trigger onPress callback");
  });

  testWidgets("Icon Button trigger long click event", (widgetTester) async {
    bool isLongPressed = false;
    await widgetTester.pumpWidget(wrapApp(
        child: TUIIconButton(
      type: TUIIconButtonType.primary,
      size: TUIIconButtonSize.px48,
      key: const Key("IconButton"),
      iconData: FluentIcons.flag_24_filled,
      onPressed: () => {},
      onLongPress: () => {isLongPressed = true},
    )));
    await widgetTester.longPress(find.byKey(const Key("IconButton")));
    expect(isLongPressed, true,
        reason: "Icon Button long press did not trigger onLongPress callback");
  });
}
