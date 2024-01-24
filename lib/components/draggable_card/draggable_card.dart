import 'package:flutter/material.dart';
import '../../styles/theme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class TUIDraggableCard extends StatelessWidget {
  final Widget child;
  final bool backgroundDark;

  const TUIDraggableCard({
    Key? key,
    required this.child,
    this.backgroundDark = false,
  }) : super(key: key);

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

// enum TUIDraggableCardState {
//   unchecked(0),
//   checked(1);
//
//   const TUIDraggableCardState(this.value);
//   final num value;
//
//   static TUIDraggableCardState getByValue(num i) {
//     return TUIDraggableCardState.values.firstWhere((x) => x.value == i);
//   }
// }
