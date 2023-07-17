import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/styles/default_colors.dart';

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

goldenGridBuilder({
  required int columns,
  required double widthToHeightRatio,
}) =>
    GoldenBuilder.grid(
        columns: columns,
        widthToHeightRatio: widthToHeightRatio,
        bgColor: TUIDefaultColors.background);

GoldenBuilder goldenColumnBuilder({WidgetWrapper? wrap}) =>
    GoldenBuilder.column(bgColor: TUIDefaultColors.background, wrap: wrap);