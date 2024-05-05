import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

import '../radio_button/radio_button.dart';

class TUIRadioRow extends StatelessWidget {
  final String title;
  final String description;
  final Function(bool)? onPressed;
  final bool isSelected;
  final bool backgroundDark;

  const TUIRadioRow({
    super.key,
    required this.title,
    this.description = "",
    this.onPressed,
    this.isSelected = false,
    this.backgroundDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final showDescription = description.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundDark ? theme.colors.background : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: getRowCrossAxisAlignment(description),
        children: [
          TUIRadioButton(
            onPressed: (isSelected) {
              if (onPressed != null) {
                onPressed!(isSelected);
              }
            },
            isSelected: isSelected,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.typography.baseBold),
              if (showDescription)
                Text(description, style: theme.typography.base)
            ],
          )
        ],
      ),
    );
  }

  CrossAxisAlignment getRowCrossAxisAlignment(String description) {
    return description.isNotEmpty
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
  }
}
