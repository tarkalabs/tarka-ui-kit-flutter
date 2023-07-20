import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/snack_bar/snack_bar.dart';

import '../defaults.dart';

void main() {
  group("Snackbar designs", () {
    testGoldens('state = Default', (tester) async {
      const Key tapTarget = Key('tap-target');
      await tester.pumpWidgetBuilder(Builder(builder: (BuildContext context) {
        return Scaffold(body: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                context: context,
                type: TUISnackBarType.warning,
                message: "This is an warning snackbar with action",
                action: TUISnackBarAction.dismiss("Dismiss"),
              ));
            },
            behavior: HitTestBehavior.opaque,
            child: const SizedBox(
              height: 100.0,
              width: 100.0,
              key: tapTarget,
            ),
          );
        }));
      }), wrapper: tuiAppWrapper());
      await tester.tap(find.byKey(tapTarget));
      await tester.pump();
      await screenMatchesGolden(tester, 'snackbar_all_size_state_default');
    });
  });
}
