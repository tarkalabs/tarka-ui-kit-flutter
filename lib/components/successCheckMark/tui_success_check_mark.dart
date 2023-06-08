import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tui_colors.dart';
import 'package:tarka_ui/styles/tui_symbols.dart';

/// TUISuccessCheckMark is used to create a success check mark.
/*
  Example:
  ```dart
  TUISuccessCheckMark()
  ```
 */
class TUISuccessCheckMark extends StatelessWidget {
  const TUISuccessCheckMark({Key? key}) : super(key: key);

  static const double size = 16;

  @override
  Widget build(BuildContext context) {
    return const Icon(
      TUISymbol.successCheckMark,
      color: TUIColors.success,
    );
  }
}
