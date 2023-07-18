import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIAppBar extends StatefulWidget {
  final List<TUIAppBarItem> items;
  final List<BottomNavigationBarItem> _bnbItems;

  final ValueChanged<int>? onTap;
  final int currentIndex;
  final bool showLabels;

  TUIAppBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
  })  : assert(
            (items.every((element) => element.label?.isEmpty == false) ||
                items.every((element) => element.label == null || element.label?.trim().isEmpty == true)),
            "Either all items should have label or none."),
        _bnbItems = _convertToBnbItems(items),
        showLabels = items.any((element) =>
            element.label != null && element.label?.trim().isEmpty == false);

  @override
  State<StatefulWidget> createState() {
    return _TUIAppBar();
  }

  static List<BottomNavigationBarItem> _convertToBnbItems(
      List<TUIAppBarItem> items) {
    return items
        .map((item) => BottomNavigationBarItem(
            icon: Padding(
              //Design says, Icon should be 24 px and Icon box should be 40px.
              padding: const EdgeInsets.all(8),
              child: Icon(item.iconData),
            ),
            label: item.label ?? "",
            tooltip: item.tooltip))
        .toList(growable: false);
  }
}

class _TUIAppBar extends State<TUIAppBar> {
  @override
  Widget build(BuildContext context) {
    TUIThemeData themeData = TUITheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: themeData.colors.surfaceVariantHover,
          height: 1,
        ),
        BottomNavigationBar(
          items: widget._bnbItems,
          onTap: widget.onTap,
          // Design says, Icon size should be 24px
          iconSize: 24,
          currentIndex: widget.currentIndex,
          showSelectedLabels: widget.showLabels,
          showUnselectedLabels: widget.showLabels,
        )
      ],
    );
  }
}

class TUIAppBarItem {
  final IconData iconData;
  final String? label;
  final String? tooltip;

  TUIAppBarItem({required this.iconData, this.label, this.tooltip});
}
