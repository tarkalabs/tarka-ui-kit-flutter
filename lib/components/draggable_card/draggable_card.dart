import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIDraggableCard is a card that can be dragged and dropped.
/*
  Example:
  ```dart
  TUIDraggableCard(
    child: Text('Hello World'),
  )
  ```
*/
class TUIDraggableCard extends StatelessWidget {
  final Widget child;
  final bool backgroundDark;

  const TUIDraggableCard({
    super.key,
    required this.child,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      decoration: getBoxDecoration(context),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FluentIcons.re_order_dots_vertical_24_filled,
            ),
          ),
          child,
        ],
      ),
    );
  }

  BoxDecoration getBoxDecoration(BuildContext context) {
    final theme = TUITheme.of(context);
    Color background = Colors.transparent;

    if (backgroundDark) {
      background = theme.colors.background;
    }

    return BoxDecoration(
      color: background,
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
