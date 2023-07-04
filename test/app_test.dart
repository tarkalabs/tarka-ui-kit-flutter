import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'defaults.dart';

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