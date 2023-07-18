import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/slider/slider.dart';

import '../defaults.dart';

main() {
  group("TUISlider callbacks", () {
    _testSliderOnChangedCallback();
    _testSliderOnChangeStartCallback();
    _testSliderOnChangeEndCallback();
  });

  group("TUIRangeSlider callbacks", () {
    _testRangeSliderOnChangedCallback();
    _testRangeSliderOnChangeStartCallback();
    _testRangeSliderOnChangeEndCallback();
  });
}

void _testSliderOnChangedCallback() {
  testWidgets("should receive new value in onChanged callback",
      (widgetTester) async {
    var sliderValue = 0.1;
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUISlider(
            value: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
          );
        },
      ),
    ), wrapper: tuiAppWrapper());

    await widgetTester.tap(find.byType(TUISlider));
    expect(sliderValue, 0.5);
  });
}

void _testSliderOnChangeStartCallback() {
  testWidgets("should receive initial/starting value in onChangeStart callback",
      (widgetTester) async {
    var sliderValue = 0.1;
    var completer = Completer<double>();
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUISlider(
            value: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
            onChangeStart: completer.complete,
          );
        },
      ),
    ), wrapper: tuiAppWrapper());

    await widgetTester.tap(find.byType(TUISlider));
    expect(completer.isCompleted, true);
    //Should receive old/starting value.
    expect(await completer.future, 0.1);
  });
}

void _testSliderOnChangeEndCallback() {
  testWidgets("should receive end/latest value in onChangeEnd callback",
      (widgetTester) async {
    var sliderValue = 0.1;
    var completer = Completer<double>();
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUISlider(
            value: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
            onChangeEnd: completer.complete,
          );
        },
      ),
    ), wrapper: tuiAppWrapper());

    await widgetTester.tap(find.byType(TUISlider));
    expect(completer.isCompleted, true);
    //Should receive new/changed value.
    expect(await completer.future, 0.5);
  });
}

void _testRangeSliderOnChangedCallback() {
  testWidgets("should receive latest/new value in onChanged callback",
      (widgetTester) async {
    var sliderValue = const TUIRangeValues(0.1, 0.9);
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUIRangeSlider(
            values: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
          );
        },
      ),
    ), wrapper: tuiAppWrapper());
    final rect = widgetTester.getRect(find.byType(TUIRangeSlider));
    await widgetTester.dragFrom(rect.centerLeft.translate(rect.width * 0.1, 0),
        Offset.fromDirection(0, rect.width * 0.4));
    expect(sliderValue, const TUIRangeValues(0.5, 0.9));
  });
}

void _testRangeSliderOnChangeStartCallback() {
  testWidgets("should receive initial/stating value in onChangeStart callback",
      (widgetTester) async {
    var sliderValue = const TUIRangeValues(0.1, 0.9);
    var completer = Completer<TUIRangeValues>();
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUIRangeSlider(
            values: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
            onChangeStart: completer.complete,
          );
        },
      ),
    ), wrapper: tuiAppWrapper());
    final rect = widgetTester.getRect(find.byType(TUIRangeSlider));
    await widgetTester.dragFrom(rect.centerLeft.translate(rect.width * 0.1, 0),
        Offset.fromDirection(0, rect.width * 0.4));
    expect(completer.isCompleted, true);
//Should receive old/starting value.
    expect(await completer.future, const TUIRangeValues(0.1, 0.9));
  });
}

void _testRangeSliderOnChangeEndCallback() {
  testWidgets("should receive end/latest value in onChangeEnd callback",
      (widgetTester) async {
    var sliderValue = const TUIRangeValues(0.1, 0.9);
    var completer = Completer<TUIRangeValues>();
    await widgetTester.pumpWidgetBuilder(Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return TUIRangeSlider(
            values: sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() => sliderValue = value);
            },
            onChangeEnd: completer.complete,
          );
        },
      ),
    ), wrapper: tuiAppWrapper());
    final rect = widgetTester.getRect(find.byType(TUIRangeSlider));
    await widgetTester.dragFrom(rect.centerLeft.translate(rect.width * 0.1, 0),
        Offset.fromDirection(0, rect.width * 0.4));
    expect(completer.isCompleted, true);
//Should receive new/changed value.
    expect(await completer.future, const TUIRangeValues(0.5, 0.9));
  });
}
