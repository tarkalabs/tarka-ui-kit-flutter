import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/tarka_ui.dart';

import '../defaults.dart';
import '../utils.dart';
import 'flutter_test_config.dart';

void main() {
  group("Icon button design all sizes", () {
    for (final type in TUIIconButtonType.values) {
      testGoldens('state = Default', (tester) async {
        final builder = _buildButton(type, () => {});
        await tester.pumpWidgetBuilder(builder.build(),
            wrapper: tuiAppWrapper());
        await screenMatchesGolden(
            tester, 'icon_button_${type.name}_all_size_state_default');
      });

      testGoldens('state = Pressed', (tester) async {
        final builder = _buildButton(type, () => {});
        await tester.pumpWidgetBuilder(builder.build(),
            wrapper: tuiAppWrapper());
        for (final size in TUIIconButtonSize.values) {
          await tester.press(find.byKey(Key(size.name)));
        }
        await screenMatchesGolden(
            tester, 'icon_button_${type.name}_all_size_state_pressed');
      });
    }
  });
}

GoldenBuilder _buildButton(TUIIconButtonType type, VoidCallback? onPress) {
  final builder = goldenGridBuilder(columns: 5, widthToHeightRatio: 1);
  for (final size in TUIIconButtonSize.values) {
    builder.addScenario(
      size.name.capitalize(),
      TUIIconButton(
        key: Key(size.name),
        type: type,
        size: size,
        onPressed: onPress,
        iconData: FluentIcons.fluent_24_filled,
      ),
    );
  }
  return builder;
}
