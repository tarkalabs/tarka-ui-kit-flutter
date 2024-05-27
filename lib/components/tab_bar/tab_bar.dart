import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

import '../button/button.dart';
import '../button/style.dart';

class TUITabBar extends StatelessWidget {
  final List<String> titles;
  final int selectedIndex;
  final Function(int)? onPressed;

  const TUITabBar({
    super.key,
    required this.titles,
    required this.selectedIndex,
    required this.onPressed,
  });

  Widget _buildItem(int index, String item) {
    return TUIButton(
      label: item,
      type: selectedIndex == index
          ? TUIButtonType.secondary
          : TUIButtonType.ghost,
      size: TUIButtonSize.s,
      customInsets: const EdgeInsets.all(4),
      onPressed: () {
        if (onPressed != null) {
          onPressed!(index);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final colors = theme.colors;

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        decoration: ShapeDecoration(
          color: colors.surfaceVariant,
          shape: const StadiumBorder(),
        ),
        height: 40,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(titles.length, (index) {
            final item = titles[index];
            return _buildItem(index, item);
          }),
        ),
      ),
    );
  }
}
