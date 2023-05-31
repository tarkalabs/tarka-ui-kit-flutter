import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tui_colors.dart';
import 'package:tarka_ui/styles/tui_text_style.dart';

/// TUIButtonType is used to define the type of button.
enum TUIButtonType { primary, secondary, outlined, ghost, danger }
/// TUIButtonSize is used to define the size of button.
enum TUIButtonSize { xs, s, m, l }
/// TUIButtonIconAlignment is used to define the alignment of icon in button.
enum TUIButtonIconAlignment { left, right, none }

/// TUIButton is used to create a button with different types, sizes and icon alignment.
class TUIButton extends StatelessWidget {
  final String? label;
  final TUIButtonType type;
  final TUIButtonSize size;
  final IconData? icon;
  final TUIButtonIconAlignment iconAlignment;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final void Function()? onPressed;
  final void Function()? onLongPressed;

  /// Creates a button with the given [label] and [icon].
  const TUIButton({
    super.key,
    this.label,
    this.type = TUIButtonType.primary,
    this.size = TUIButtonSize.m,
    this.icon,
    this.iconAlignment = TUIButtonIconAlignment.none,
    this.foregroundColor,
    this.backgroundColor,
    this.borderSideColor,
    this.onPressed,
    this.onLongPressed,
  }) : assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _getIconAndLabel(),
    );
    switch (type) {
      case TUIButtonType.primary:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: _getSize(),
              backgroundColor: backgroundColor ?? _getBackgroundColor(),
              foregroundColor: foregroundColor ?? _getForegroundColor(),
              textStyle: _getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TUIButtonType.secondary:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: _getSize(),
              backgroundColor: backgroundColor ?? _getBackgroundColor(),
              foregroundColor: foregroundColor ?? _getForegroundColor(),
              textStyle: _getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TUIButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: _getSize(),
              backgroundColor: backgroundColor ?? _getBackgroundColor(),
              foregroundColor: foregroundColor ?? _getForegroundColor(),
              textStyle: _getTextStyle(),
              shape: const StadiumBorder(),
              side: BorderSide(color: borderSideColor ?? TUIColors.onSurface)),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TUIButtonType.ghost:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: _getSize(),
              backgroundColor: backgroundColor ?? _getBackgroundColor(),
              foregroundColor: foregroundColor ?? _getForegroundColor(),
              textStyle: _getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TUIButtonType.danger:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: _getSize(),
              backgroundColor: backgroundColor ?? _getBackgroundColor(),
              foregroundColor: foregroundColor ?? _getForegroundColor(),
              textStyle: _getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
    }
  }

  _getIconAndLabel() {
    switch (iconAlignment) {
      case TUIButtonIconAlignment.left:
      case TUIButtonIconAlignment.none:
        return [
          if (icon != null) Icon(icon, size: _getIconSize()),
          if (icon != null && label != null) const SizedBox(width: 8),
          if (label != null) Text(label!, textAlign: TextAlign.center),
        ];

      case TUIButtonIconAlignment.right:
        return [
          if (label != null) Text(label!, textAlign: TextAlign.center),
          if (icon != null && label != null) const SizedBox(width: 8),
          if (icon != null) Icon(icon, size: _getIconSize()),
        ];
      default:
    }
  }

  Color _getForegroundColor() {
    switch (type) {
      case TUIButtonType.primary:
        return TUIColors.onPrimary;
      case TUIButtonType.secondary:
        return TUIColors.onSecondary;
      case TUIButtonType.outlined:
        return TUIColors.onSurface;
      case TUIButtonType.ghost:
        return TUIColors.secondary;
      case TUIButtonType.danger:
        return TUIColors.onPrimary;
    }
  }

  Color _getBackgroundColor() {
    switch (type) {
      case TUIButtonType.primary:
        return TUIColors.primary;
      case TUIButtonType.secondary:
        return TUIColors.secondary;
      case TUIButtonType.outlined:
        return TUIColors.surfaceHover;
      case TUIButtonType.ghost:
        return TUIColors.transparent;
      case TUIButtonType.danger:
        return TUIColors.error;
    }
  }

  double _getIconSize() {
    switch (size) {
      case TUIButtonSize.xs:
      case TUIButtonSize.s:
        return 12;
      case TUIButtonSize.m:
      case TUIButtonSize.l:
        return 18;
    }
  }

  Size _getSize() {
    switch (size) {
      case TUIButtonSize.xs:
        return const Size.fromHeight(24);
      case TUIButtonSize.s:
        return const Size.fromHeight(32);
      case TUIButtonSize.m:
        return const Size.fromHeight(40);
      case TUIButtonSize.l:
        return const Size.fromHeight(48);
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case TUIButtonSize.xs:
        return TUITextStyle.button8;
      case TUIButtonSize.s:
        return TUITextStyle.button7;
      case TUIButtonSize.m:
      case TUIButtonSize.l:
        return TUITextStyle.button6;
    }
  }
}
