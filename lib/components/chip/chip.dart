import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/text_style.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/subcomponents/image.dart';

/// TUIChip widget to display a chip with title, left icon, right icon and badge.
///
/// Example:
/// ```dart
/// TUIChip(
///   title: "Chip 1",
///   size: TUIChipSize.m,
///   highlighted: false,
///   leftIcon: FluentIcons.attach_12_regular,
///   badgeValue: "2",
///   rightIcon: FluentIcons.dismiss_12_filled,
///   onRightIconTap: () {
///     print("Right icon tapped");
///   },
///  )
///   ```
class TUIChip extends StatelessWidget {
  final String title;
  final TUIChipSize size;
  final bool highlighted;
  final IconData? leftIcon;
  final TUIImage? leftIconImage;
  final String? badgeValue;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;

  const TUIChip({
    super.key,
    required this.title,
    this.size = TUIChipSize.m,
    this.highlighted = false,
    this.leftIcon,
    this.leftIconImage,
    this.badgeValue,
    this.rightIcon,
    this.onRightIconTap,
  });

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);
    Widget chipContent = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: getChipDecoration(theme),
          height: size._height,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getLeftIcon(theme),
              getLeftIconPaddingIfNeeded(theme),
              Text(
                title,
                style: getTextStyle(theme),
              ),
              getRightIconPaddingIfNeeded(theme),
              getDismissOrRightIcon(theme),
            ].whereType<Widget>().toList(),
          ),
        ),
      ],
    );

    if (badgeValue != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Badge(
              label: Text(
                style:
                    size._badgeTextStyle.copyWith(color: theme.colors.onError),
                badgeValue!,
              ),
              child: chipContent),
        ],
      );
    } else {
      return chipContent;
    }
  }

  BoxDecoration getChipDecoration(TUIThemeData theme) {
    if (!highlighted) {
      return BoxDecoration(
        border: Border.all(color: theme.colors.outline, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: theme.colors.surfaceHover,
      );
    } else {
      return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: theme.colors.secondary,
      );
    }
  }

  Icon getDismissIconImage(TUIThemeData theme) {
    if (highlighted) {
      return Icon(
        FluentIcons.dismiss_12_filled,
        color: theme.colors.onSecondary,
        size: 12,
      );
    } else {
      return const Icon(
        FluentIcons.dismiss_12_filled,
        size: 12,
      );
    }
  }

  Widget? getDismissOrRightIcon(TUIThemeData theme) {
    if (onRightIconTap != null && rightIcon == null) {
      return GestureDetector(
        onTap: onRightIconTap,
        child: getDismissIconImage(theme),
      );
    } else {
      return getRightIcon(theme);
    }
  }

  Widget? getLeftIcon(TUIThemeData theme) {
    if (leftIcon != null) {
      if (highlighted) {
        return Icon(
          leftIcon!,
          color: theme.colors.onSecondary,
        );
      } else {
        return Icon(
          leftIcon!,
          color: theme.colors.onSurface,
        );
      }
    } else if (leftIconImage != null) {
      return leftIconImage!;
    } else {
      return null;
    }
  }

  Widget? getLeftIconPaddingIfNeeded(TUIThemeData theme) {
    if (getLeftIcon(theme) != null) {
      return const SizedBox(width: 11);
    } else {
      return null;
    }
  }

  Widget? getRightIcon(TUIThemeData theme) {
    if (rightIcon != null) {
      if (highlighted) {
        return GestureDetector(
          onTap: onRightIconTap,
          child: Icon(
            rightIcon!,
            color: theme.colors.onSecondary,
            size: size._rightIconSize,
          ),
        );
      } else {
        return GestureDetector(
          onTap: onRightIconTap,
          child: Icon(
            rightIcon!,
            size: size._rightIconSize,
          ),
        );
      }
    }

    return null;
  }

  Widget? getRightIconPaddingIfNeeded(TUIThemeData theme) {
    if (getDismissOrRightIcon(theme) != null) {
      return SizedBox(width: size._rightIconPadding);
    } else {
      return null;
    }
  }

  TextStyle getTextStyle(TUIThemeData theme) {
    if (!highlighted) {
      return TUITextStyle.button7.copyWith(color: theme.colors.onSurface);
    } else {
      return TUITextStyle.button7.copyWith(color: theme.colors.onSecondary);
    }
  }
}

/// TUIChipSize is used to define the size of the chip, there are only two sizes for now, `medium` and `large`.
enum TUIChipSize {
  m(
      height: 32,
      textStyle: TUITextStyle.body7,
      rightIconSize: 12,
      rightIconPadding: 10.25,
      badgeSize: 16,
      badgeTextStyle: TUITextStyle.button8),
  l(
      height: 40,
      textStyle: TUITextStyle.body6,
      rightIconSize: 16,
      rightIconPadding: 13.75,
      badgeSize: 24,
      badgeTextStyle: TUITextStyle.button7);

  const TUIChipSize(
      {required double height,
      required TextStyle textStyle,
      required double rightIconSize,
      required double rightIconPadding,
      required double badgeSize,
      required TextStyle badgeTextStyle})
      : _height = height,
        _rightIconSize = rightIconSize,
        _rightIconPadding = rightIconPadding,
        _badgeTextStyle = badgeTextStyle;

  final double _height;
  final double _rightIconSize;
  final double _rightIconPadding;
  final TextStyle _badgeTextStyle;
}
