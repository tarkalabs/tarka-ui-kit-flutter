import 'package:flutter/material.dart';
import 'package:tarka_ui/components/avatar/tui_avatar.dart';
import 'package:tarka_ui/styles/tui_colors.dart';

enum TUITagIconType { none, left, right }

enum TUITagSize {
  s,
  m,
  l;

  double _getTagSize() {
    switch (this) {
      case s:
        return 24;
      case m:
        return 32;
      case l:
        return 42;
    }
  }
}

enum TUITagContrast {
  low,
  high;

  Color _getColor() {
    switch (this) {
      case low:
        return TUIColors.secondary;
      case high:
        return TUIColors.secondaryAlt;
    }
  }
}

class TUITagIconContent {
  final IconData? icon;
  final TUIImage? image;

  TUITagIconContent({this.icon, this.image});
}

class TUITag extends StatelessWidget {
  final TUITagSize tagSize;
  final TUITagContrast tagContrast;
  final TUITagIconContent? tagIconContent;
  final TUITagIconType tagIconType;
  final String tagText;

  const TUITag({
    super.key,
    required this.tagSize,
    required this.tagText,
    required this.tagIconType,
    this.tagContrast = TUITagContrast.low,
    this.tagIconContent,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
