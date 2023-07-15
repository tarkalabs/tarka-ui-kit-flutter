import 'package:flutter/material.dart';

import '../../styles/theme.dart';

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
    Widget child = Container(
      width: 24,
      height: 24,
      color: getCheckboxBackgroundColor(context),
    );

    return GestureDetector(
      onTap: () {
        _setState(TUICheckBoxState.getByValue(1));
      },
      child: child,
    );
  }

  BoxDecoration getBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: getCheckboxBorder(context),
    );
  }

  Border getCheckboxBorder(BuildContext context) {
    final theme = TUITheme.of(context);

    Color borderColor = (widget.isEnabled == true)
        ? theme.colors.outline
        : theme.colors.disabledContent;

    return Border.all(width: 1.5, color: borderColor);
  }

  Color? getCheckboxBackgroundColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return (state == TUICheckBoxState.unchecked)
        ? null
        : ((widget.isEnabled == true)
            ? theme.colors.primary
            : theme.colors.disabledBackground);
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
