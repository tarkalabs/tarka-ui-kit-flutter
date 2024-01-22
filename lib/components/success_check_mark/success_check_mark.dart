import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/symbols.dart';

import '../../styles/theme.dart';

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
    final theme = TUITheme.of(context);
    final colors = theme.colors;

    return Icon(
      TUISymbol.successCheckMark,
      color: colors.success,
    );
  }
}
