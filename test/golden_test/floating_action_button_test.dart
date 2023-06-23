import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/tarka_ui.dart';

import '../defaults.dart';
import '../utils.dart';

void main() {
  group("FAB button design all sizes", () {
    testGoldens('state = Default', (tester) async {
      final builder = _buildButton(() => {});
      await tester.pumpWidgetBuilder(builder.build(), wrapper: tuiAppWrapper());
      await screenMatchesGolden(tester, 'fab_all_size_state_default');
    });

    testGoldens('state = Pressed', (tester) async {
      final builder = _buildButton(() => {});
      await tester.pumpWidgetBuilder(builder.build(), wrapper: tuiAppWrapper());
      for (final size in TUIFloatingActionButtonSize.values) {
        await tester.press(find.byKey(Key(size.name)));
      }
      await screenMatchesGolden(tester, 'fab_all_size_state_pressed');
    });
  });
}

GoldenBuilder _buildButton(VoidCallback? onPress) {
  final builder = GoldenBuilder.grid(
      columns: 2, widthToHeightRatio: 2, bgColor: TUIDefaultColors.background);
  for (final size in TUIFloatingActionButtonSize.values) {
    builder.addScenario(
      size.name.capitalize(),
      TUIFloatingActionButton(
        key: Key(size.name),
        size: size,
        onPressed: onPress,
        iconData: FluentIcons.fluent_24_filled,
      ),
    );
  }
  return builder;
}
