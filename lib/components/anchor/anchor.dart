import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIAnchor is a component that is used to create a clickable anchor.
/*
  Example:
  ```dart
  TUIAnchor(
    title: 'Anchor',
    onPressed: () {
      print('Anchor pressed');
    },
  )
  ```
*/
class TUIAnchor extends StatefulWidget {
  const TUIAnchor({
    super.key,
    required this.title,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  State<TUIAnchor> createState() => _TUIAnchor();
}

class _TUIAnchor extends State<TUIAnchor> {
  bool isPressed = false;

  _setPressed(bool pressed) {
    setState(() {
      isPressed = pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    Color? rectangleColor = (isPressed == true) ? theme.colors.secondary : null;
    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 24.0,
            width: 4.0,
            color: rectangleColor,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 10, 10, 10),
            child: Text(
              widget.title,
              style: theme.typography.body6.copyWith(
                color: theme.colors.inputTextDim,
              ),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
    return GestureDetector(
      onTap: () {
        _setPressed(!isPressed);
        widget.onPressed?.call();
      },
      child: child,
    );
  }
}
