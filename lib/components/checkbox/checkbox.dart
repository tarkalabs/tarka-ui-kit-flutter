import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUICheckBox extends StatefulWidget {
  TUICheckBox({
    super.key,
    this.enableMixedState = false,
    this.state = TUICheckBoxState.unchecked,
    this.onChanged,
  }) {
    if (state == TUICheckBoxState.mixed) {
      enableMixedState = true;
    }
  }

  late bool enableMixedState;
  final TUICheckBoxState state;
  final Function(TUICheckBoxState)? onChanged;

  @override
  State<TUICheckBox> createState() => _TUICheckBoxState();
}

class _TUICheckBoxState extends State<TUICheckBox> {
  TUICheckBoxState state = TUICheckBoxState.unchecked;

  @override
  initState() {
    super.initState();
    state = widget.state;
  }

  _setState() {
    setState(() {
      if (widget.enableMixedState == true) {
        int rawValue = state.index;
        state = TUICheckBoxState.getByValue((rawValue + 1) % 3);
      } else {
        if (state == TUICheckBoxState.unchecked) {
          state = TUICheckBoxState.checked;
        } else {
          state = TUICheckBoxState.unchecked;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: getBoxDecoration(context),
          child: getIcon(context),
        ),
      ],
    );

    return GestureDetector(
        onTap: () {
          if (widget.onChanged != null) {
            _setState();
            widget.onChanged?.call(state);
          }
        },
        child: child);
  }

  Icon getIcon(BuildContext context) {
    return Icon(
      getIsSelectableIconImage(),
      color: getIconColor(context),
      size: 18,
    );
  }

  Color getIconColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return (widget.onChanged != null)
        ? theme.colors.onPrimary
        : theme.colors.disabledContent;
  }

  IconData? getIsSelectableIconImage() {
    return (state == TUICheckBoxState.unchecked)
        ? null
        : ((state == TUICheckBoxState.checked)
            ? FluentIcons.checkmark_24_regular
            : FluentIcons.subtract_24_regular);
  }

  BoxDecoration getBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: getCheckboxBackgroundColor(context),
      border: getCheckboxBorder(context),
    );
  }

  Border? getCheckboxBorder(BuildContext context) {
    final theme = TUITheme.of(context);

    Color borderColor = (widget.onChanged != null)
        ? theme.colors.outline
        : theme.colors.disabledContent;

    return (state == TUICheckBoxState.unchecked)
        ? Border.all(width: 1.5, color: borderColor)
        : null;
  }

  Color? getCheckboxBackgroundColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return (state == TUICheckBoxState.unchecked)
        ? null
        : ((widget.onChanged != null)
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
