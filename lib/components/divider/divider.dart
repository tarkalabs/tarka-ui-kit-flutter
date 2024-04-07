import 'package:flutter/material.dart';

/// TUIDividerVerticalPadding is used to define the vertical padding of divider.
enum TUIDividerVerticalPadding { none, s }

/// TUIDividerHorizontalPadding is used to define the horizontal padding of divider.
enum TUIDividerHorizontalPadding { none, s, m, l, xl }

/// TUIDividerType is used to define the type of divider.
enum TUIDividerType { horizontal, vertical }

/// TKDivider is used to create a divider with default height and color.
///
///   Example:
///   ```dart
///   TUIDivider(
///     type: TUIDividerType.horizontal,
///     color: TUIColors.surfaceVariantHover,
///     verticalPadding: TUIDividerVerticalPadding.s,
///     horizontalPadding: TUIDividerHorizontalPadding.s,
///   )
///   ```
class TUIDivider extends StatelessWidget {
  final TUIDividerType? type;
  final Color? color;
  final TUIDividerVerticalPadding? verticalPadding;
  final TUIDividerHorizontalPadding? horizontalPadding;
  const TUIDivider({
    super.key,
    this.type = TUIDividerType.horizontal,
    this.color,
    this.verticalPadding = TUIDividerVerticalPadding.none,
    this.horizontalPadding = TUIDividerHorizontalPadding.none,
  });

  @override
  Widget build(BuildContext context) {
    return type == TUIDividerType.horizontal
        ? Divider(
            thickness: 2,
            color: color,
            indent: _getHorizontalPadding(),
            endIndent: _getHorizontalPadding(),
          )
        : VerticalDivider(
            thickness: 2,
            color: color,
            indent: _getVerticalPadding(),
          );
  }

  double _getVerticalPadding() {
    switch (verticalPadding) {
      case TUIDividerVerticalPadding.none:
        return 0;
      case TUIDividerVerticalPadding.s:
        return 8;
      default:
        return 0;
    }
  }

  double _getHorizontalPadding() {
    switch (horizontalPadding) {
      case TUIDividerHorizontalPadding.none:
        return 0;
      case TUIDividerHorizontalPadding.s:
        return 8;
      case TUIDividerHorizontalPadding.m:
        return 16;
      case TUIDividerHorizontalPadding.l:
        return 24;
      case TUIDividerHorizontalPadding.xl:
        return 32;
      default:
        return 0;
    }
  }
}
