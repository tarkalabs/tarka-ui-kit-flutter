import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIIconButton extends StatelessWidget {
  const TUIIconButton(
      {super.key,
      required this.type,
      required this.size,
      required this.iconData,
      this.onPressed,
      this.onLongPress});

  final TUIIconButtonType type;
  final TUIIconButtonSize size;
  final IconData iconData;

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
    TUIThemeData theme = TUITheme.of(context);
    final buttonStyles = theme.iconButtonStyles;
    final ButtonColorStyle colorStyle = switch (type) {
      TUIIconButtonType.primary => buttonStyles.primary,
      TUIIconButtonType.secondary => buttonStyles.secondary,
      TUIIconButtonType.outlined => buttonStyles.outlined,
      TUIIconButtonType.ghost => buttonStyles.ghost,
    };

    final buttonStyle = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: colorStyle.backgroundColor,
        foregroundColor: colorStyle.foregroundColor,
        side: colorStyle.borderSide,
        //Required to remove excess padding. i.e. By default button tries to size itself to min 48. (MaterialTapTargetSize.padding)
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        //Ensure - No ripple effect.
        splashFactory: NoSplash.splashFactory,
        fixedSize: MaterialStateProperty.all(Size.square(size.size)),
        minimumSize: MaterialStateProperty.all(const Size(0, 0)),
        alignment: Alignment.center,
        iconColor: colorStyle.foregroundColor,
        iconSize: MaterialStateProperty.all(size.iconSize));

    final Widget buttonChild = Icon(iconData);

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
