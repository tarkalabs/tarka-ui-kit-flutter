import 'package:flutter/material.dart';

class TUIDraggableCard extends StatelessWidget {
  final Widget child;

  const TUIDraggableCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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
