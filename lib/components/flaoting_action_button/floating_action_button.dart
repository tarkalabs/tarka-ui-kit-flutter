import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

enum TUIFloatingActionButtonSize {
  large(96, 28),
  regular(56, 24),
  small(40, 24);

  const TUIFloatingActionButtonSize(this.size, this.iconSize);

  final double size;
  final double iconSize;
}

class TUIFloatingActionButton extends StatefulWidget {
  const TUIFloatingActionButton({
    Key? key,
    this.size = TUIFloatingActionButtonSize.large,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  final TUIFloatingActionButtonSize size;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _TUIFloatingActionButton();
}

class _TUIFloatingActionButton extends State<TUIFloatingActionButton> {
  bool isPressed = false;

  _setPressed(bool pressed) {
    if (isPressed != pressed) {
      setState(() {
        isPressed = pressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    final FloatingActionButton fab;
    final icon = Icon(
      widget.iconData,
      size: widget.size.iconSize,
    );
    final circleBorder = CircleBorder(
        side: isPressed
            ? BorderSide(width: 0.5, color: theme.colors.onSurface)
            : BorderSide.none);
    final backgroundColor =
        isPressed ? theme.colors.primary : theme.colors.primaryHover;

    switch (widget.size) {
      case TUIFloatingActionButtonSize.large:
        fab = FloatingActionButton.large(
            onPressed: widget.onPressed,
            backgroundColor: backgroundColor,
            shape: circleBorder,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: icon);
      case TUIFloatingActionButtonSize.regular:
      case TUIFloatingActionButtonSize.small:
        fab = FloatingActionButton(
            onPressed: widget.onPressed,
            backgroundColor: backgroundColor,
            shape: circleBorder,
            mini: widget.size == TUIFloatingActionButtonSize.small,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: icon);
    }

    return GestureDetector(
      onTapDown: (details) => _setPressed(true),
      onTapUp: (details) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: fab,
    );
  }
}
