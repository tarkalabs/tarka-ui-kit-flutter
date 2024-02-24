import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// TUITypography is a class that holds all the text styles used in the Tarka UI.
class TUITypography with Diagnosticable {
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;
  final TextStyle heading7;
  final TextStyle body5;
  final TextStyle body6;
  final TextStyle body7;
  final TextStyle body8;
  final TextStyle button6;
  final TextStyle button7;
  final TextStyle button8;

  TUITypography(
      this.heading1,
      this.heading2,
      this.heading3,
      this.heading4,
      this.heading5,
      this.heading6,
      this.heading7,
      this.body5,
      this.body6,
      this.body7,
      this.body8,
      this.button6,
      this.button7,
      this.button8);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>('heading1', heading1))
      ..add(DiagnosticsProperty<TextStyle>('heading2', heading2))
      ..add(DiagnosticsProperty<TextStyle>('heading3', heading3))
      ..add(DiagnosticsProperty<TextStyle>('heading4', heading4))
      ..add(DiagnosticsProperty<TextStyle>('heading5', heading5))
      ..add(DiagnosticsProperty<TextStyle>('heading6', heading6))
      ..add(DiagnosticsProperty<TextStyle>('heading7', heading7))
      ..add(DiagnosticsProperty<TextStyle>('body5', body5))
      ..add(DiagnosticsProperty<TextStyle>('body6', body6))
      ..add(DiagnosticsProperty<TextStyle>('body7', body7))
      ..add(DiagnosticsProperty<TextStyle>('body8', body8))
      ..add(DiagnosticsProperty<TextStyle>('button6', button6))
      ..add(DiagnosticsProperty<TextStyle>('button7', button7))
      ..add(DiagnosticsProperty<TextStyle>('button8', button8));
  }
}
