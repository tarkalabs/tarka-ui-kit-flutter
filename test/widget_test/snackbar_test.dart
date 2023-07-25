import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/snack_bar/snack_bar.dart';

import '../defaults.dart';

void main() {
  testWidgets('SnackBar control test', (WidgetTester widgetTester) async {
    const String message = 'This is SnackBar';
    const Key tapTarget = Key('tap-target');
    final snackBarWidget =
        Scaffold(body: Builder(builder: (BuildContext context) {
      return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
              context: context,
              type: TUISnackBarType.success,
              message: message,
              action: TUISnackBarAction.dismiss("Dismiss"),
            ));
          },
          behavior: HitTestBehavior.opaque,
          child: const SizedBox(height: 100.0, width: 100.0, key: tapTarget));
    }));
    await widgetTester.pumpWidgetBuilder(snackBarWidget,
        wrapper: tuiAppWrapper());
    expect(find.text(message), findsNothing);
    await widgetTester.tap(find.byKey(tapTarget), warnIfMissed: false);
    await widgetTester.pump();
    expect(find.text(message), findsOneWidget);
  });

  testWidgets('SnackBar action test', (WidgetTester widgetTester) async {
    bool isClicked = false;
    const String message = 'This is SnackBar';
    const Key tapTarget = Key('tap-target');
    final snackBarWidget =
        Scaffold(body: Builder(builder: (BuildContext context) {
      return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                context: context,
                type: TUISnackBarType.success,
                message: message,
                action: TUISnackBarAction(
                    label: "ACTION",
                    onActionPressed: () {
                      isClicked = true;
                    })));
          },
          behavior: HitTestBehavior.opaque,
          child: const SizedBox(height: 100.0, width: 100.0, key: tapTarget));
    }));
    await widgetTester.pumpWidgetBuilder(snackBarWidget,
        wrapper: tuiAppWrapper());
    await widgetTester.tap(find.byKey(tapTarget), warnIfMissed: false);
    await widgetTester.pump();
    await widgetTester.tap(find.text('ACTION'));
    expect(isClicked, true,
        reason: "Action button click did not trigger onActionPressed callback");
  });
}
