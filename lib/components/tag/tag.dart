import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUITag is used to create a tag with contrast, icon type, size and text content.
///
///  Example:
///  ```dart
///  TUITag(
///    tagContrast: TUITagContrast.low,
///    tagIconType: TUITagIconType.left,
///    tagSize: TUITagSize.s,
///    tagText: 'Tag',
///  )
///  ```
class TUITag extends StatelessWidget {
  final TUITagContrast tagContrast;
  final TUITagIconType tagIconType;
  final TUITagSize tagSize;
  final String tagText;

  const TUITag({
    super.key,
    this.tagContrast = TUITagContrast.low,
    required this.tagIconType,
    required this.tagSize,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: tagContrast._getColor(theme),
          ),
          height: tagSize._getTagSize(),
          padding: EdgeInsets.fromLTRB(
              tagSize._getLeftPadding(tagIconType),
              tagSize._getVerticalPadding(),
              tagSize._getRightPadding(tagIconType),
              tagSize._getVerticalPadding()),
          child: _getIconAndText(theme),
        ),
      ],
    );
  }

  Widget _getIconAndText(TUIThemeData theme) {
    switch (tagIconType) {
      case TUITagIconType.none:
        return Row(
          children: [
            Text(
              tagText,
              style: tagSize._getTextStyle(theme).copyWith(
                    color: tagContrast._getTextColor(theme),
                  ),
            ),
          ],
        );
      case TUITagIconType.left:
        return Row(
          children: [
            Icon(
              Icons.circle_outlined,
              size: tagSize._getIconSize(),
              color: tagContrast._getTextColor(theme),
            ),
            SizedBox(width: tagSize._getSpacingBetweenIconAndText()),
            Text(
              tagText,
              style: tagSize._getTextStyle(theme).copyWith(
                    color: tagContrast._getTextColor(theme),
                  ),
            ),
          ],
        );
      case TUITagIconType.right:
        return Row(
          children: [
            Text(
              tagText,
              style: tagSize._getTextStyle(theme).copyWith(
                    color: tagContrast._getTextColor(theme),
                  ),
            ),
            SizedBox(width: tagSize._getSpacingBetweenIconAndText()),
            Icon(
              Icons.circle_outlined,
              size: tagSize._getIconSize(),
              color: tagContrast._getTextColor(theme),
            )
          ],
        );
    }
  }
}

/// TUITagContrast is used to define the contrast of the tag, text color and icon color are computed based on contrast.
enum TUITagContrast {
  low,
  high;

  Color _getColor(TUIThemeData theme) {
    switch (this) {
      case low:
        return theme.colors.secondary;
      case high:
        return theme.colors.secondaryAlt;
    }
  }

  Color _getTextColor(TUIThemeData theme) {
    switch (this) {
      case low:
        return theme.colors.onSecondary;
      case high:
        return theme.colors.onSecondaryAlt;
    }
  }
}

/// TUITagIconType is used to define the position of the icon in the tag.
enum TUITagIconType { none, left, right }

/// TUITagSize is used to define the size of the tag.
/// IconSize, leftPadding, rightPadding, space between icon and text, tag height, text style, and vertical padding are computed based on tag size.
enum TUITagSize {
  s,
  m,
  l;

  double _getIconSize() {
    switch (this) {
      case s:
        return 12;
      case m:
      case l:
        return 16;
    }
  }

  double _getLeftPadding(TUITagIconType iconType) {
    switch (this) {
      case s:
        switch (iconType) {
          case TUITagIconType.none:
            return 8;
          case TUITagIconType.left:
            return 6;
          case TUITagIconType.right:
            return 10;
        }
      case m:
        switch (iconType) {
          case TUITagIconType.none:
          case TUITagIconType.right:
            return 12;
          case TUITagIconType.left:
            return 8;
        }
      case l:
        switch (iconType) {
          case TUITagIconType.none:
          case TUITagIconType.right:
            return 16;
          case TUITagIconType.left:
            return 12;
        }
    }
  }

  double _getRightPadding(TUITagIconType iconType) {
    switch (this) {
      case s:
        switch (iconType) {
          case TUITagIconType.none:
            return 8;
          case TUITagIconType.left:
            return 10;
          case TUITagIconType.right:
            return 6;
        }
      case m:
        switch (iconType) {
          case TUITagIconType.none:
          case TUITagIconType.left:
            return 12;
          case TUITagIconType.right:
            return 8;
        }
      case l:
        switch (iconType) {
          case TUITagIconType.none:
          case TUITagIconType.left:
            return 16;
          case TUITagIconType.right:
            return 12;
        }
    }
  }

  double _getSpacingBetweenIconAndText() {
    switch (this) {
      case s:
        return 6;
      case m:
        return 8;
      case l:
        return 10;
    }
  }

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

  TextStyle _getTextStyle(TUIThemeData theme) {
    switch (this) {
      case s:
        return theme.typography.xsSemiBold;
      case m:
        return theme.typography.smSemiBold;
      case l:
        return theme.typography.baseSemiBold;
    }
  }

  double _getVerticalPadding() {
    switch (this) {
      case s:
        return 5;
      case m:
        return 7;
      case l:
        return 10;
    }
  }
}
