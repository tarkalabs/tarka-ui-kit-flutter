import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/styles/text_style.dart';
import 'package:tarka_ui/subcomponents/image.dart';

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
    Widget chipContent = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: getChipDecoration(),
          height: size._height,
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getLeftIcon(),
              getLeftIconPaddingIfNeeded(),
              Text(
                title,
                style: getTextStyle(),
              ),
              getRightIconPaddingIfNeeded(),
              getDismissOrRightIcon(),
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
                style: size._badgeTextStyle
                    .copyWith(color: TUIDefaultColors.onError),
                badgeValue!,
              ),
              child: chipContent),
        ],
      );
    } else {
      return chipContent;
    }
  }

  BoxDecoration getChipDecoration() {
    if (!highlighted) {
      return BoxDecoration(
        border: Border.all(color: TUIDefaultColors.outline, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: TUIDefaultColors.surfaceHover,
      );
    } else {
      return const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: TUIDefaultColors.secondary,
      );
    }
  }

  Icon getDismissIconImage() {
    if (highlighted) {
      return const Icon(
        FluentIcons.dismiss_12_filled,
        color: TUIDefaultColors.onSecondary,
        size: 12,
      );
    } else {
      return const Icon(
        FluentIcons.dismiss_12_filled,
        size: 12,
      );
    }
  }

  Widget? getDismissOrRightIcon() {
    if (onRightIconTap != null && rightIcon == null) {
      return GestureDetector(
        onTap: onRightIconTap,
        child: getDismissIconImage(),
      );
    } else {
      return getRightIcon();
    }
  }

  Widget? getLeftIcon() {
    if (leftIcon != null) {
      if (highlighted) {
        return Icon(
          leftIcon!,
          color: TUIDefaultColors.onSecondary,
        );
      } else {
        return Icon(
          leftIcon!,
          color: TUIDefaultColors.onSurface,
        );
      }
    } else if (leftIconImage != null) {
      return leftIconImage!;
    } else {
      return null;
    }
  }

  Widget? getLeftIconPaddingIfNeeded() {
    if (getLeftIcon() != null) {
      return const SizedBox(width: 11);
    } else {
      return null;
    }
  }

  Widget? getRightIcon() {
    if (rightIcon != null) {
      if (highlighted) {
        return GestureDetector(
          onTap: onRightIconTap,
          child: Icon(
            rightIcon!,
            color: TUIDefaultColors.onSecondary,
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

  Widget? getRightIconPaddingIfNeeded() {
    if (getDismissOrRightIcon() != null) {
      return SizedBox(width: size._rightIconPadding);
    } else {
      return null;
    }
  }

  TextStyle getTextStyle() {
    if (!highlighted) {
      return TUITextStyle.button7.copyWith(color: TUIDefaultColors.onSurface);
    } else {
      return TUITextStyle.button7.copyWith(color: TUIDefaultColors.onSecondary);
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
