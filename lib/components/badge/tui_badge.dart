import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tui_colors.dart';
import 'package:tarka_ui/styles/tui_text_style.dart';

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

  TextStyle _getStyle() {
    switch (this) {
      case xs:
      case s:
        return TUITextStyle.button8.copyWith(
          color: TUIColors.onError,
        );
      case l:
        return TUITextStyle.button7.copyWith(
          color: TUIColors.onError,
        );
    }
  }

  EdgeInsets _getEdgeInsets() {
    switch (this) {
      case l:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case s:
        return const EdgeInsets.symmetric(horizontal: 5, vertical: 1);
      case xs:
        return const EdgeInsets.fromLTRB(3, 0, 3, 0);
    }
  }
}

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
    Widget badgeContent;

    if (content != null && isNumbered) {
      return Container(
        height: badgeSize._getBadgeSize(),
        constraints: BoxConstraints(
          minHeight: badgeSize._getBadgeSize(), //minimum height
          minWidth: badgeSize._getBadgeSize(), // minimum width
          maxHeight: badgeSize._getBadgeSize(),
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
            color: TUIColors.error,
            borderRadius: BorderRadius.all(Radius.circular(20))),
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
        decoration: const BoxDecoration(
            color: TUIColors.error,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      );
    }
  }
}
