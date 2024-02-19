import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUICheckBoxRow extends StatefulWidget {
  final String title;
  final String description;
  final bool backgroundDark;
  final bool enableMixedState;
  final TUICheckBoxRowState state;
  final Function(TUICheckBoxRowState)? onChanged;

  const TUICheckBoxRow({
    super.key,
    this.enableMixedState = false,
    this.state = TUICheckBoxRowState.unchecked,
    required this.title,
    this.description = "",
    this.onChanged,
    this.backgroundDark = false,
  });

  @override
  State<StatefulWidget> createState() => _TUICheckBoxRowState();
}

class _TUICheckBoxRowState extends State<TUICheckBoxRow> {
  TUICheckBoxRowState state = TUICheckBoxRowState.unchecked;
  bool _enableMixedState = false;

  @override
  initState() {
    super.initState();
    state = widget.state;
    if (state == TUICheckBoxRowState.mixed) {
      _enableMixedState = true;
    }
  }

  _setState() {
    setState(() {
      if (_enableMixedState == true) {
        int rawValue = state.index;
        state = TUICheckBoxRowState.getByValue((rawValue + 1) % 3);
      } else {
        if (state == TUICheckBoxRowState.unchecked) {
          state = TUICheckBoxRowState.checked;
        } else {
          state = TUICheckBoxRowState.unchecked;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final showDescription = widget.description.isNotEmpty;
    Widget child = Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: getRowCrossAxisAlignment(widget.description),
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: getBoxDecoration(context),
          margin: getMarginIfDescription(context, widget.description),
          child: getIcon(context),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: theme.typography.heading7
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            if (showDescription)
              Text(
                widget.description,
                style: theme.typography.body7.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              )
          ],
        )
      ],
    );

    return GestureDetector(
      onTap: () {
        if (widget.onChanged != null) {
          _setState();
          widget.onChanged?.call(state);
        }
      },
      child: Container(
        decoration: getBoxDecorationRow(context),
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10.0),
        child: child,
      ),
    );
  }

  CrossAxisAlignment getRowCrossAxisAlignment(String description) {
    return description.isNotEmpty
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
  }

  EdgeInsets getMarginIfDescription(context, String descrption) {
    return descrption.isNotEmpty
        ? const EdgeInsets.only(top: 3.0)
        : const EdgeInsets.only(top: 0.0);
  }

  BoxDecoration getBoxDecorationRow(context) {
    final theme = TUITheme.of(context);
    Color backgroundColor = Colors.transparent;

    if (widget.backgroundDark) {
      backgroundColor = theme.colors.background;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(12.0),
      ),
    );
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
    return (state == TUICheckBoxRowState.unchecked)
        ? null
        : ((state == TUICheckBoxRowState.checked)
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

    return (state == TUICheckBoxRowState.unchecked)
        ? Border.all(width: 1.5, color: borderColor)
        : null;
  }

  Color? getCheckboxBackgroundColor(BuildContext context) {
    final theme = TUITheme.of(context);

    return (state == TUICheckBoxRowState.unchecked)
        ? null
        : ((widget.onChanged != null)
            ? theme.colors.primary
            : theme.colors.disabledBackground);
  }
}

enum TUICheckBoxRowState {
  unchecked(0),
  mixed(1),
  checked(2);

  const TUICheckBoxRowState(this.value);
  final num value;

  static TUICheckBoxRowState getByValue(num i) {
    return TUICheckBoxRowState.values.firstWhere((x) => x.value == i);
  }
}
