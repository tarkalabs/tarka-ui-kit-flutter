import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIButton is used to create a button with label, icon and button type.
/*
  Example:
    ```dart
  TUIButton(
    type: TUIButtonType.primary,
    size: TUIButtonSize.m,
    label: 'Primary',
    onPressed: () {},
  ),
   ```
 */
class TUIButton extends StatelessWidget {
  const TUIButton({
    super.key,
    required this.type,
    this.size = TUIButtonSize.m,
    this.label,
    this.iconData,
    this.iconPosition = TUIButtonIconPosition.left,
    required this.onPressed,
    this.onLongPress,
    this.height,
  })  : assert(label != null || iconData != null);

  final TUIButtonType type;
  final TUIButtonSize size;
  final String? label;
  final IconData? iconData;
  final TUIButtonIconPosition? iconPosition;
  final double? height;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final buttonStyles = theme.buttonStyles;
    final ButtonColorStyle colorStyle = switch (type) {
      TUIButtonType.primary => buttonStyles.primary,
      TUIButtonType.secondary => buttonStyles.secondary,
      TUIButtonType.outlined => buttonStyles.outlined,
      TUIButtonType.ghost => buttonStyles.ghost,
      TUIButtonType.danger => buttonStyles.danger,
    };

    final ButtonSizeStyle sizeStyle = switch (size) {
      TUIButtonSize.xs => buttonStyles.xs,
      TUIButtonSize.s => buttonStyles.s,
      TUIButtonSize.m => buttonStyles.m,
      TUIButtonSize.l => buttonStyles.l,
    };

    final buttonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: colorStyle.backgroundColor,
        foregroundColor: colorStyle.foregroundColor,
        side: colorStyle.borderSide,
        //Required to remove excess padding. i.e. By default button tries to size itself to min 48. (MaterialTapTargetSize.padding)
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
            label != null ? const StadiumBorder() : const CircleBorder()),
        //Ensure - No ripple effect.
        splashFactory: NoSplash.splashFactory,
        fixedSize:
            MaterialStateProperty.all(Size.fromHeight(height ?? size.height)),
        minimumSize: MaterialStateProperty.all(const Size(0, 0)),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(
            label == null
                ? sizeStyle.paddingVertical
                : (iconData != null &&
                        iconPosition == TUIButtonIconPosition.left)
                    ? sizeStyle.paddingIconToBorder
                    : sizeStyle.paddingTextToBorder,
            sizeStyle.paddingVertical,
            label == null
                ? sizeStyle.paddingVertical
                : (iconData != null &&
                        iconPosition == TUIButtonIconPosition.right)
                    ? sizeStyle.paddingIconToBorder
                    : sizeStyle.paddingTextToBorder,
            sizeStyle.paddingVertical)),
        textStyle: MaterialStateProperty.all(sizeStyle.textStyle),
        iconColor: colorStyle.foregroundColor,
        iconSize: MaterialStateProperty.all(sizeStyle.iconSize));

    final Widget buttonChild;
    if (label != null && iconData != null) {
      buttonChild = Row(
        textDirection: iconPosition == TUIButtonIconPosition.left
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          SizedBox(width: sizeStyle.paddingTextToIcon),
          Text(label!),
        ],
      );
    } else if (label != null) {
      buttonChild = Text(label!);
    } else {
      buttonChild = Icon(iconData);
    }

    return Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: buttonStyle,
          child: buttonChild,
        ));
  }
}

enum TUIButtonIconPosition {
  left,
  right;
}
