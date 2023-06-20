import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarka_ui/tarka_ui.dart';

import 'deafults.dart';

Widget wrapApp({required Widget child}) {
  return TUIApp(
    home: child,
    theme: defaultTheme(),
  );
}

void main() {
  testWidgets('Should not have ripple effect', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapApp(
        child: const SizedBox()
      ),
    );
    BuildContext context = tester.element(find.byType(SizedBox));
    final materialTheme = Theme.of(context);
    expect(materialTheme.splashFactory, NoSplash.splashFactory);
  });
}