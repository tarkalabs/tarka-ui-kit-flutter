import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/snack_bar/snack_bar.dart';

import '../defaults.dart';

void main() {
  group("SnackBar all types", () {
    for (final type in TUISnackBarType.values) {
      testGoldens('Without Action, Type =${type.name}', (tester) async {
        Key tapTarget = Key(type.name);
        final builder = _buildSnackBar(type, tapTarget, false);
        await tester.pumpWidgetBuilder(Scaffold(body: builder),
            wrapper: tuiAppWrapper());
        await tester.tap(find.byKey(tapTarget), warnIfMissed: false);
        await screenMatchesGolden(
            tester, 'snack_bar_${type.name}_without_action');
      });
    }
    for (final type in TUISnackBarType.values) {
      testGoldens('With Action, Type =${type.name} ', (tester) async {
        Key tapTarget = Key(type.name);
        final builder = _buildSnackBar(type, tapTarget, true);
        await tester.pumpWidgetBuilder(Scaffold(body: builder),
            wrapper: tuiAppWrapper());
        await tester.tap(find.byKey(tapTarget), warnIfMissed: false);
        await screenMatchesGolden(tester, 'snack_bar_${type.name}_with_action');
      });
    }
  });
}

Widget _buildSnackBar(TUISnackBarType type, Key tapTarget, bool action) {
  return Builder(builder: (BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
          context: context,
          type: type,
          message: "This is ${type.name} SnackBar",
          action: action ? TUISnackBarAction.dismiss("Dismiss") : null,
        ));
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 100.0,
        width: 100.0,
        key: tapTarget,
      ),
    );
  });
}
