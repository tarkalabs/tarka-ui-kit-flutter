import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

import '../radio_button/radio_button.dart';

class TUIRadioRow extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onPressed;
  final bool? isSelected;
  final bool backgroundDark;

  const TUIRadioRow({
    super.key,
    required this.title,
    this.description = "",
    this.onPressed,
    this.isSelected,
    this.backgroundDark = false,
  });

  TUIRadioButton getRadioButton() {
    if (isSelected == null) {
      return TUIRadioButton(
        onPressed: () {},
      );
    } else {
      return TUIRadioButton(
        onPressed: () {},
        isSelected: isSelected ?? false,
      );
    }
  }

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
          getRadioButton(),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.typography.heading7
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              if (showDescription)
                Text(
                  description,
                  style: theme.typography.body7.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                )
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
