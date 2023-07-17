import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/slider/slider.dart';

import '../defaults.dart';
import 'flutter_test_config.dart';

main() {
  _sliderNotPressed();
}

void _sliderNotPressed() {
  testGoldens("Slider not pressed", (tester) async {
    var builder = goldenColumnBuilder()
      ..addScenario(
          "Slider",
          TUISlider(
            value: 0.1,
            onChanged: (value) {},
            max: 1,
            min: 0,
          ))
      ..addScenario(
          "Range Slider",
          TUIRangeSlider(
            values: const TUIRangeValues(0.1, 0.9),
            min: 0,
            max: 1,
            onChanged: (newValue) => {},
          ));
    await tester.pumpWidgetBuilder(builder.build(),
        wrapper: (widget) => tuiAppWrapper()(Scaffold(
              body: widget,
            )));
    await screenMatchesGolden(tester, "slider_not_pressed");
  });
}