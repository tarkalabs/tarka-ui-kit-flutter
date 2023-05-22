import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tk_colors.dart';
import 'package:tarka_ui/styles/tk_text_style.dart';

/// TKButtonType is used to define the type of button.
enum TKButtonType { primary, secondary, outlined, ghost, danger }
/// TKButtonSize is used to define the size of button.
enum TKButtonSize { xs, s, m, l }
/// TKButtonIconAlignment is used to define the alignment of icon in button.
enum TKButtonIconAlignment { left, right, none }

/// TKButton is used to create a button with different types, sizes and icon alignment.
class TKButton extends StatelessWidget {
  final String? label;
  final TKButtonType type;
  final TKButtonSize size;
  final IconData? icon;
  final TKButtonIconAlignment iconAlignment;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final void Function()? onPressed;
  final void Function()? onLongPressed;

  /// Creates a button with the given [label] and [icon].
  const TKButton({
    super.key,
    required this.label,
    this.type = TKButtonType.primary,
    this.size = TKButtonSize.m,
    this.icon,
    this.iconAlignment = TKButtonIconAlignment.none,
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
      children: getIconAndLabel(),
    );
    switch (type) {
      case TKButtonType.primary:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: getSize(),
              backgroundColor: backgroundColor ?? getBackgroundColor(),
              foregroundColor: foregroundColor ?? getForegroundColor(),
              textStyle: getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TKButtonType.secondary:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: getSize(),
              backgroundColor: backgroundColor ?? getBackgroundColor(),
              foregroundColor: foregroundColor ?? getForegroundColor(),
              textStyle: getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TKButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: getSize(),
              backgroundColor: backgroundColor ?? getBackgroundColor(),
              foregroundColor: foregroundColor ?? getForegroundColor(),
              textStyle: getTextStyle(),
              shape: const StadiumBorder(),
              side: BorderSide(color: borderSideColor ?? TKColors.onSurface)),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TKButtonType.ghost:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: getSize(),
              backgroundColor: backgroundColor ?? getBackgroundColor(),
              foregroundColor: foregroundColor ?? getForegroundColor(),
              textStyle: getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
      case TKButtonType.danger:
        return TextButton(
          style: TextButton.styleFrom(
              minimumSize: getSize(),
              backgroundColor: backgroundColor ?? getBackgroundColor(),
              foregroundColor: foregroundColor ?? getForegroundColor(),
              textStyle: getTextStyle(),
              shape: const StadiumBorder()),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: child,
        );
    }
  }

  getIconAndLabel() {
    switch (iconAlignment) {
      case TKButtonIconAlignment.left:
      case TKButtonIconAlignment.none:
        return [
          if (icon != null) Icon(icon, size: getIconSize()),
          if (icon != null && label != null) const SizedBox(width: 8),
          if (label != null) Text(label!, textAlign: TextAlign.center),
        ];

      case TKButtonIconAlignment.right:
        return [
          if (label != null) Text(label!, textAlign: TextAlign.center),
          if (icon != null && label != null) const SizedBox(width: 8),
          if (icon != null) Icon(icon, size: getIconSize()),
        ];
      default:
    }
  }

  Color getForegroundColor() {
    switch (type) {
      case TKButtonType.primary:
        return TKColors.onPrimary;
      case TKButtonType.secondary:
        return TKColors.onSecondary;
      case TKButtonType.outlined:
        return TKColors.onSurface;
      case TKButtonType.ghost:
        return TKColors.secondary;
      case TKButtonType.danger:
        return TKColors.onPrimary;
    }
  }

  Color getBackgroundColor() {
    switch (type) {
      case TKButtonType.primary:
        return TKColors.primary;
      case TKButtonType.secondary:
        return TKColors.secondary;
      case TKButtonType.outlined:
        return TKColors.surfaceHover;
      case TKButtonType.ghost:
        return TKColors.transparent;
      case TKButtonType.danger:
        return TKColors.error;
    }
  }

  double getIconSize() {
    switch (size) {
      case TKButtonSize.xs:
      case TKButtonSize.s:
        return 12;
      case TKButtonSize.m:
      case TKButtonSize.l:
        return 18;
    }
  }

  Size getSize() {
    switch (size) {
      case TKButtonSize.xs:
        return const Size.fromHeight(24);
      case TKButtonSize.s:
        return const Size.fromHeight(32);
      case TKButtonSize.m:
        return const Size.fromHeight(40);
      case TKButtonSize.l:
        return const Size.fromHeight(48);
    }
  }

  TextStyle getTextStyle() {
    switch (size) {
      case TKButtonSize.xs:
        return TKTextStyle.button8;
      case TKButtonSize.s:
        return TKTextStyle.button7;
      case TKButtonSize.m:
      case TKButtonSize.l:
        return TKTextStyle.button6;
    }
  }
}
