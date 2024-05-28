import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

import '../button/button.dart';
import '../button/style.dart';

enum TabBarSize { regular, large }

class TUITabBar extends StatelessWidget {
  final List<String> titles;
  final int selectedIndex;
  final TabBarSize size;
  final Function(int)? onPressed;

  const TUITabBar({
    super.key,
    required this.titles,
    required this.selectedIndex,
    required this.size,
    required this.onPressed,
  });

  Widget _buildItem(int index, String item) {
    return Padding(
      padding: EdgeInsets.fromLTRB(index == 0 ? 4 : 2, 4, 2, 4),
      child: TUIButton(
        label: item,
        type: selectedIndex == index
            ? TUIButtonType.secondary
            : TUIButtonType.ghost,
        size: size == TabBarSize.regular ? TUIButtonSize.s : TUIButtonSize.m,
        onPressed: () {
          if (onPressed != null) {
            onPressed!(index);
          }
        },
      ),
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
        height: size == TabBarSize.regular ? 40 : 48,
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
