import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIRadioButton is a button that can be selected or deselected, and is used to indicate a choice.
/*
  Example:
  ```dart
  TUIRadioButton(
    onPressed: () {
      print('Button pressed');
    },
    isSelected: true,
  ),
  ```
 */
class TUIRadioButton extends StatefulWidget {
  const TUIRadioButton({
    super.key,
    this.onPressed,
    this.isSelected = false,
  });

  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  State<TUIRadioButton> createState() => _TUIRadioButtonState();
}

class _TUIRadioButtonState extends State<TUIRadioButton> {
  bool isSelected = false;

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    isSelected = widget.isSelected;
  }

  _setState() {
    setState(() {
      if (isSelected) {
        isSelected = false;
      } else {
        isSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    child = Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: getOuterContainerColor(context),
        border: getOuterBorder(context),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getColorOfInnerContainer(context),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          _setState();
          widget.onPressed?.call();
        }
      },
      child: child,
    );
  }

  Color? getColorOfInnerContainer(BuildContext context) {
    final theme = TUITheme.of(context);

    return (isSelected)
        ? (widget.onPressed != null
            ? theme.colors.onPrimary
            : theme.colors.disabledContent)
        : null;
  }

  Color? getOuterContainerColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return isSelected
        ? (widget.onPressed != null
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

    return (widget.onPressed != null)
        ? theme.colors.outline
        : theme.colors.disabledContent;
  }
}
