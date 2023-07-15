import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIAnchor extends StatefulWidget {
  const TUIAnchor({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

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

    TextStyle textStyle = theme.typography.body6.copyWith(
      color: theme.colors.inputTextDim,
    );

    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 24.0,
          width: 4.0,
          color: rectangleColor,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 10, 10, 10),
          child: Text(
            widget.title,
            style: theme.typography.body6.copyWith(
              color: theme.colors.inputTextDim,
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
        child: child);
  }
}
