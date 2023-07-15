import 'package:flutter/material.dart';

class TUICheckBox extends StatefulWidget {
  const TUICheckBox({
    Key? key,
    this.isEnabled = true,
    this.enableMixedState = false,
    this.state = TUICheckBoxState.unchecked,
    this.onPressed,
  }) : super(key: key);

  final bool isEnabled;
  final bool enableMixedState;
  final TUICheckBoxState state;
  final VoidCallback? onPressed;

  @override
  State<TUICheckBox> createState() => _TUICheckBoxState();
}

class _TUICheckBoxState extends State<TUICheckBox> {
  TUICheckBoxState? state;

  _setState(TUICheckBoxState state) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Placeholder();

    return GestureDetector(
      onTap: () {
        _setState(TUICheckBoxState.getByValue(1));
      },
      child: child,
    );
  }
}

enum TUICheckBoxState {
  unchecked(0),
  mixed(1),
  checked(2);

  const TUICheckBoxState(this.value);
  final num value;

  static TUICheckBoxState getByValue(num i) {
    return TUICheckBoxState.values.firstWhere((x) => x.value == i);
  }
}
