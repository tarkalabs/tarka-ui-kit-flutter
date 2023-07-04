import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/tarka_ui.dart' as tui;

/// TUIButtonType is used to define the type of button.
enum TUIButtonType { primary, secondary, outlined, ghost, danger }

/// TUIButtonSize is used to define the size of button.
enum TUIButtonSize {
  xs(24),
  s(32),
  m(40),
  l(48);

  const TUIButtonSize(
    this.height,
  );

  final double height;
}

// TUIIconButtonType is used to define the type of button.
enum TUIIconButtonType {
  primary,
  secondary,
  outlined,
  ghost,
}

/// TUIIconButtonSize is used to define the size of button.
enum TUIIconButtonSize {
  px20(20, 12),
  px24(24, 12),
  px32(32, 24),
  px40(40, 24),
  px48(48, 24);

  const TUIIconButtonSize(this.size, this.iconSize);

  final double size;
  final double iconSize;
}

/// TUIButtonIconAlignment is used to define the alignment of icon in button.
enum TUIButtonIconAlignment { left, right, none }

class ButtonStyles with Diagnosticable {
  final ButtonColorStyle primary;
  final ButtonColorStyle secondary;
  final ButtonColorStyle outlined;
  final ButtonColorStyle ghost;
  final ButtonColorStyle danger;
  final ButtonSizeStyle xs;
  final ButtonSizeStyle s;
  final ButtonSizeStyle m;
  final ButtonSizeStyle l;

  ButtonStyles(this.primary, this.secondary, this.outlined, this.ghost,
      this.danger, this.xs, this.s, this.m, this.l);

  ButtonStyles.from(tui.TUIColors colors, tui.TUITypography typography)
      : primary = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                colors.primary, colors.primaryHover, colors.disabledBackground),
            foregroundColor: _createStateProperty(
              colors.onPrimary,
              colors.onPrimary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none,
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide.none)),
        secondary = ButtonColorStyle(
            backgroundColor: _createStateProperty(colors.secondary,
                colors.secondaryHover, colors.disabledBackground),
            foregroundColor: _createStateProperty(
              colors.onSecondary,
              colors.onSecondary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none,
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide.none)),
        outlined = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                Colors.transparent, colors.surfaceHover, Colors.transparent),
            foregroundColor: _createStateProperty(
              colors.onSurface,
              colors.onSurface,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide(color: colors.onSurface, width: 2),
                BorderSide(color: colors.disabledContent, width: 1.5))),
        ghost = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                Colors.transparent, colors.surfaceHover, Colors.transparent),
            foregroundColor: _createStateProperty(
              colors.secondary,
              colors.secondary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none, BorderSide.none, BorderSide.none)),
        danger = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                colors.error, colors.errorHover, colors.disabledBackground),
            foregroundColor: _createStateProperty(
              colors.onPrimary,
              colors.onPrimary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none,
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide.none)),
        xs = ButtonSizeStyle(
            textStyle: typography.button8,
            iconSize: 16,
            paddingVertical: 5,
            paddingTextToBorder: 8,
            paddingIconToBorder: 4,
            paddingTextToIcon: 4),
        s = ButtonSizeStyle(
            textStyle: typography.button7,
            iconSize: 16,
            paddingVertical: 7,
            paddingTextToBorder: 16,
            paddingIconToBorder: 8,
            paddingTextToIcon: 4),
        m = ButtonSizeStyle(
            textStyle: typography.button6,
            iconSize: 24,
            paddingVertical: 10,
            paddingTextToBorder: 24,
            paddingIconToBorder: 16,
            paddingTextToIcon: 8),
        l = ButtonSizeStyle(
            textStyle: typography.button6,
            iconSize: 24,
            paddingVertical: 14,
            paddingTextToBorder: 24,
            paddingIconToBorder: 16,
            paddingTextToIcon: 8);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ButtonColorStyle>("primary", primary))
      ..add(DiagnosticsProperty<ButtonColorStyle>("secondary", secondary))
      ..add(DiagnosticsProperty<ButtonColorStyle>("outlined", outlined))
      ..add(DiagnosticsProperty<ButtonColorStyle>("ghost", ghost))
      ..add(DiagnosticsProperty<ButtonColorStyle>("danger", danger))
      ..add(DiagnosticsProperty<ButtonSizeStyle>("xs", xs))
      ..add(DiagnosticsProperty<ButtonSizeStyle>("s", s))
      ..add(DiagnosticsProperty<ButtonSizeStyle>("m", m))
      ..add(DiagnosticsProperty<ButtonSizeStyle>("l", l));
  }
}

class IconButtonStyles with Diagnosticable {
  final ButtonColorStyle primary;
  final ButtonColorStyle secondary;
  final ButtonColorStyle outlined;
  final ButtonColorStyle ghost;

  IconButtonStyles(
    this.primary,
    this.secondary,
    this.outlined,
    this.ghost,
  );

  IconButtonStyles.from(tui.TUIColors colors)
      : primary = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                colors.primary, colors.primaryHover, colors.disabledBackground),
            foregroundColor: _createStateProperty(
              colors.onPrimary,
              colors.onPrimary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none,
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide.none)),
        secondary = ButtonColorStyle(
            backgroundColor: _createStateProperty(colors.secondary,
                colors.secondaryHover, colors.disabledBackground),
            foregroundColor: _createStateProperty(
              colors.onSecondary,
              colors.onSecondary,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none,
                BorderSide(color: colors.onSurface, width: 1.5),
                BorderSide.none)),
        outlined = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                Colors.transparent, colors.surfaceHover, Colors.transparent),
            foregroundColor: _createStateProperty(
              colors.onSurface,
              colors.onSurface,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide(color: colors.outline, width: 1.5),
                BorderSide(color: colors.onSurface, width: 2),
                BorderSide(color: colors.disabledContent, width: 1.5))),
        ghost = ButtonColorStyle(
            backgroundColor: _createStateProperty(
                Colors.transparent, colors.surfaceHover, Colors.transparent),
            foregroundColor: _createStateProperty(
              colors.onSurface,
              colors.onSurface,
              colors.disabledContent,
            ),
            borderSide: _createStateProperty(
                BorderSide.none, BorderSide.none, BorderSide.none));

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ButtonColorStyle>("primary", primary))
      ..add(DiagnosticsProperty<ButtonColorStyle>("secondary", secondary))
      ..add(DiagnosticsProperty<ButtonColorStyle>("outlined", outlined))
      ..add(DiagnosticsProperty<ButtonColorStyle>("ghost", ghost));
  }
}

class ButtonSizeStyle with Diagnosticable {
  final TextStyle textStyle;
  final double iconSize;
  final double paddingVertical;
  final double paddingTextToBorder;
  final double paddingIconToBorder;
  final double paddingTextToIcon;

  ButtonSizeStyle({
    required this.textStyle,
    required this.iconSize,
    required this.paddingVertical,
    required this.paddingTextToBorder,
    required this.paddingIconToBorder,
    required this.paddingTextToIcon,
  });

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>("textStyle", textStyle))
      ..add(DoubleProperty("iconSize", iconSize))
      ..add(DoubleProperty("paddingVertical", paddingVertical))
      ..add(DoubleProperty("paddingTextToBorder", paddingTextToBorder))
      ..add(DoubleProperty("paddingIconToBorder", paddingIconToBorder))
      ..add(DoubleProperty("paddingTextToIcon", paddingTextToIcon));
  }
}

class ButtonColorStyle with Diagnosticable {
  ButtonColorStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderSide,
  });

  final MaterialStateProperty<Color?> backgroundColor;
  final MaterialStateProperty<Color?> foregroundColor;
  final MaterialStateProperty<BorderSide?> borderSide;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<MaterialStateProperty>(
          "backgroundColor", backgroundColor))
      ..add(DiagnosticsProperty<MaterialStateProperty>(
          "foregroundColor", foregroundColor))
      ..add(
          DiagnosticsProperty<MaterialStateProperty>("borderSide", borderSide));
  }
}

MaterialStateProperty<T?> _createStateProperty<T>(
    T? normal, T? pressed, T? disabled) {
  return MaterialStateProperty.resolveWith<T?>(
    (states) {
      if (states.isDisabled) {
        return disabled;
      } else if (states.isPressed || states.isFocused || states.isHovered) {
        return pressed;
      } else {
        return normal;
      }
    },
  );
}

extension MaterialStateSet on Set<MaterialState> {
  bool get isDisabled => contains(MaterialState.disabled);

  bool get isHovered => contains(MaterialState.hovered);

  bool get isPressed => contains(MaterialState.pressed);

  bool get isFocused => contains(MaterialState.focused);
}
