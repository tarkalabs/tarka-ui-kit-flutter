import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';

class TUIToggleRow extends StatefulWidget {
  final String title;
  final String description;
  final Icon? icon;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool backgroundDark;

  TUIToggleRow({
    Key? key,
    required this.title,
    this.description = "",
    this.icon,
    required this.value,
    this.onChanged,
    this.backgroundDark = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TUIToggleRowState();
}

class _TUIToggleRowState extends State<TUIToggleRow> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.backgroundDark
            ? theme.colors.background
            : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: widget.description.isNotEmpty
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          getIcon(),
          getTitleDescription(theme),
          getSpacer(),
          TUIToggleSwitch(
            value: widget.value,
            onChanged: (value) {
              setState(() {
                _value = !_value;
              });
              widget.onChanged?.call(value);
            },
          ),
        ],
      ),
    );
  }

  getSpacer() {
    if (widget.icon == null && widget.description.isEmpty) {
      return const Spacer();
    }

    return const SizedBox(
      width: 0,
    );
  }

  getTitleDescription(TUIThemeData theme) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: theme.typography.heading7,
            overflow: TextOverflow.ellipsis,
          ),
          getDescription(theme),
        ],
      ),
    );
  }

  getDescription(TUIThemeData theme) {
    if (widget.description.isNotEmpty) {
      return Text(
        widget.description,
        style: theme.typography.body7,
      );
    }

    return Container();
  }

  getIcon() {
    if (widget.icon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: widget.icon,
      );
    }

    return Container();
  }
}
