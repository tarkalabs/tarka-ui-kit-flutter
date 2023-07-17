import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/slider/slider.dart';

import '../defaults.dart';
import 'flutter_test_config.dart';

main() {
  _sliderNotPressed();
  _sliderPressed();
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

void _sliderPressed() {
  testGoldens("Slider pressed", (tester) async {
    final rangeSliderKey1 = GlobalKey();
    final rangeSliderKey2 = GlobalKey();
    var builder = StatefulBuilder(
      builder: (context, setState) {
        var goldenBuilder = goldenColumnBuilder()
          ..addScenario(
              "Slider",
              TUISlider(
                value: 0.1,
                onChanged: (value) {},
                max: 1,
                min: 0,
              ))
          ..addScenario(
              "Range Slider Left Pressed",
              TUIRangeSlider(
                key: rangeSliderKey1,
                values: const TUIRangeValues(0.1, 0.9),
                min: 0,
                max: 1,
                onChanged: (newValue) => {},
              ))
          ..addScenario(
              "Range Slider Right Pressed",
              TUIRangeSlider(
                key: rangeSliderKey2,
                values: const TUIRangeValues(0.1, 0.9),
                min: 0,
                max: 1,
                onChanged: (newValue) => {},
              ));
        return goldenBuilder.build();
      },
    );
    await tester.pumpWidgetBuilder(builder,
        wrapper: (widget) => tuiAppWrapper()(Scaffold(
              body: widget,
            )));
    var sliderRect = tester.getRect(find.byType(TUISlider));
    final rangeSliderRect1 = tester.getRect(find.byKey(rangeSliderKey1));
    final rangeSliderRect2 = tester.getRect(find.byKey(rangeSliderKey2));
    await tester.startGesture(
        sliderRect.centerLeft.translate(sliderRect.width * 0.1, 0));
    await tester.startGesture(
        rangeSliderRect1.centerLeft.translate(rangeSliderRect1.width * 0.1, 0));
    await tester.startGesture(
        rangeSliderRect2.centerRight.translate(sliderRect.width * -0.1, 0));
    await screenMatchesGolden(tester, "slider_pressed");
  });
}
