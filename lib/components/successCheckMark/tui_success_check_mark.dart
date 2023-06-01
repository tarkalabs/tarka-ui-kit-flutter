import 'package:flutter/material.dart';

import '../../styles/tui_colors.dart';
import '../../styles/tui_symbols.dart';

class TUISuccessCheckMark extends StatelessWidget {
  const TUISuccessCheckMark({Key? key}) : super(key: key);

  static const double size = 16;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: TUISuccessCheckMark.size,
      height: TUISuccessCheckMark.size,
      child: Icon(
        TUISymbol.successCheckMark,
        color: TUIColors.success,
      ),
    );
  }
}
