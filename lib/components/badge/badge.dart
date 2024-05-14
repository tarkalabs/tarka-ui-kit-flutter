import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

enum TUIBadgeSize {
  xs,
  s,
  l;

  double _getBadgeSize() {
    switch (this) {
      case xs:
        return 12;
      case s:
        return 16;
      case l:
        return 24;
    }
  }

  Radius _getBorderRadius() {
    switch (this) {
      case xs:
        return const Radius.circular(6);
      case s:
        return const Radius.circular(8);
      case l:
        return const Radius.circular(12);
    }
  }

  EdgeInsets _getEdgeInsets() {
    switch (this) {
      case xs:
        return const EdgeInsets.all(0);
      case s:
        return const EdgeInsets.symmetric(horizontal: 4);
      case l:
        return const EdgeInsets.symmetric(horizontal: 8);
    }
  }

  TextStyle _getStyle(TUIThemeData theme) {
    final colors = theme.colors;
    final typography = theme.typography;
    switch (this) {
      case xs:
        return typography.xs2SemiBold.copyWith(
          color: colors.onError,
        );
      case s:
        return typography.xsSemiBold.copyWith(
          color: colors.onError,
        );
      case l:
        return typography.smSemiBold.copyWith(
          color: colors.onError,
        );
    }
  }
}

/// TUIBadge is used to create a Badge with content, size and badge flag.
///
///  Example:
///  ```dart
///  TUIBadge(
///    badgeSize: TUIBadgeSize.xs,
///    content: '1',
///    isNumbered: true,
///  ),
///  ```
class TUIBadge extends StatelessWidget {
  final TUIBadgeSize badgeSize;
  final String? content;
  final Color? badgeColor;

  const TUIBadge(
      {super.key, required this.badgeSize, this.content, this.badgeColor});

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);

    if (content != null && badgeSize != TUIBadgeSize.xs) {
      return Container(
        height: badgeSize._getBadgeSize(),
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: badgeSize._getBadgeSize(), //minimum height
          minWidth: badgeSize._getBadgeSize(), // minimum width
        ),
        decoration: BoxDecoration(
          color: theme.colors.error,
          borderRadius: BorderRadius.all(badgeSize._getBorderRadius()),
        ),
        padding: badgeSize._getEdgeInsets(),
        child: Text(
          content!,
          style: badgeSize._getStyle(theme),
        ),
      );
    } else {
      return Container(
        height: badgeSize._getBadgeSize(),
        width: badgeSize._getBadgeSize(),
        padding: badgeSize._getEdgeInsets(),
        decoration: BoxDecoration(
            color: badgeColor ?? theme.colors.error,
            borderRadius: BorderRadius.all(badgeSize._getBorderRadius())),
      );
    }
  }
}
