import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';

/// TUIToggleRow widget row with a title, description and a toggle switch.
///
///   Example:
///   ```dart
///   TUIToggleRow(
///     title: 'Title',
///     description: 'Description',
///     icon: Icon(Icons.ac_unit),
///     value: true,
///     onChanged: (value) {
///       print(value);
///     },
///   ),
///   ```
class TUIToggleRow extends StatelessWidget {
  final String title;
  final String description;
  final Icon? icon;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool backgroundDark;

  const TUIToggleRow({
    super.key,
    required this.title,
    this.description = "",
    this.icon,
    required this.value,
    this.onChanged,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundDark ? theme.colors.background : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: description.isNotEmpty
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          _getIcon(),
          _getTitleDescription(theme),
          _getSpacer(),
          TUIToggleSwitch(
            value: value,
            onChanged: (value) {
              onChanged?.call(value);
            },
          ),
        ],
      ),
    );
  }

  _getSpacer() {
    if (icon == null && description.isEmpty) {
      return const Spacer();
    }

    return const SizedBox(
      width: 0,
    );
  }

  _getTitleDescription(TUIThemeData theme) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.typography.heading7,
            overflow: TextOverflow.ellipsis,
          ),
          _getDescription(theme),
        ],
      ),
    );
  }

  _getDescription(TUIThemeData theme) {
    if (description.isNotEmpty) {
      return Text(
        description,
        style: theme.typography.body7,
      );
    }

    return Container();
  }

  _getIcon() {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: icon,
      );
    }

    return Container();
  }
}
