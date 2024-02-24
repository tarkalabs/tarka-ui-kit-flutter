import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/styles/text_style.dart';

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
        return const EdgeInsets.fromLTRB(3, 0, 3, 0);
      case s:
        return const EdgeInsets.symmetric(horizontal: 5, vertical: 1);
      case l:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    }
  }

  TextStyle _getStyle() {
    switch (this) {
      case xs:
        return TUITextStyle.button8.copyWith(
          color: TUIDefaultColors.onError,
          fontSize: 10,
        );
      case s:
        return TUITextStyle.button8.copyWith(
          color: TUIDefaultColors.onError,
        );
      case l:
        return TUITextStyle.button7.copyWith(
          color: TUIDefaultColors.onError,
        );
    }
  }
}

/// TUIBadge is used to create a Badge with content, size and badge flag.
/*
  Example:
  ```dart
  TUIBadge(
    badgeSize: TUIBadgeSize.xs,
    content: '1',
    isNumbered: true,
  ),
  ```
 */
class TUIBadge extends StatelessWidget {
  final TUIBadgeSize badgeSize;
  final String? content;
  final bool isNumbered;

  const TUIBadge({
    super.key,
    required this.badgeSize,
    this.content,
    this.isNumbered = false,
  });

  @override
  Widget build(BuildContext context) {
    if (content != null && isNumbered) {
      return Container(
        height: badgeSize._getBadgeSize(),
        constraints: BoxConstraints(
          minHeight: badgeSize._getBadgeSize(), //minimum height
          minWidth: badgeSize._getBadgeSize(), // minimum width
          maxHeight: badgeSize._getBadgeSize(),
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          color: TUIDefaultColors.error,
          borderRadius: BorderRadius.all(badgeSize._getBorderRadius()),
        ),
        padding: badgeSize._getEdgeInsets(),
        child: Text(
          content!,
          style: badgeSize._getStyle(),
        ),
      );
    } else {
      return Container(
        height: badgeSize._getBadgeSize(),
        width: badgeSize._getBadgeSize(),
        padding: badgeSize._getEdgeInsets(),
        decoration: const BoxDecoration(
            color: TUIDefaultColors.error,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      );
    }
  }
}