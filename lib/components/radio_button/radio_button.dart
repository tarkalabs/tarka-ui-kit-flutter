import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIRadioButton is a button that can be selected or deselected, and is used to indicate a choice.
///
///  Example:
///  ```dart
///  TUIRadioButton(
///    onPressed: () {
///      print('Button pressed');
///    },
///    isSelected: true,
///  ),
///  ```
class TUIRadioButton extends StatelessWidget {
  final Function(bool)? onPressed;
  final bool isSelected;

  const TUIRadioButton({
    super.key,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;

    child = Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getOuterContainerColor(context),
        border: getOuterBorder(context),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: getColorOfInnerContainer(context),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!(isSelected);
        }
      },
      child: child,
    );
  }

  Color? getColorOfInnerContainer(BuildContext context) {
    final theme = TUITheme.of(context);

    return (isSelected)
        ? (onPressed != null
            ? theme.colors.onPrimary
            : theme.colors.disabledContent)
        : null;
  }

  Color? getOuterContainerColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return isSelected
        ? (onPressed != null
            ? theme.colors.primary
            : theme.colors.disabledBackground)
        : null;
  }

  Border? getOuterBorder(BuildContext context) {
    return (!isSelected)
        ? Border.all(width: 1.5, color: getOuterBorderColor(context))
        : null;
  }

  Color getOuterBorderColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return (onPressed != null)
        ? theme.colors.outline
        : theme.colors.disabledContent;
  }
}
