import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
        // To draw Real shadow of elevations of widgets.
        // If set to false, The shadow is replaced by black border.
        // To see this effect, set to false and generate golden for Floating Action Button.
        enableRealShadows: true),
  );
}
