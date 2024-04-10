import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/components/menu_item/menu_item.dart';
import 'package:tarka_ui/components/mobile_overlay_footer/mobile_overlay_footer.dart';
import 'package:tarka_ui/components/mobile_overlay_header/mobile_overlay_header.dart';

import '../../styles/theme.dart';

class TUIMobileOverlayMenu extends StatelessWidget {
  final String title;
  final VoidCallback? action;
  final double padding = 16;
  final double verticalGap = 8;
  late List<MenuItem> menuItems;

  TUIMobileOverlayMenu({
    super.key,
    required this.title,
    required this.action,
    required List<TUIMenuItem> menuItems,
  }) {
    final menuItemsList = <MenuItem>[];

    for (int index = 0; index < menuItems.length; index++) {
      final menuItem = MenuItem(
        view: menuItems[index],
        index: index,
      );
      menuItemsList.add(menuItem);
    }

    this.menuItems = menuItemsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getHeaderView(context),
        getMenuItemView(context),
        getFooterView(context),
      ],
    );
  }

  Widget getHeaderView(BuildContext context) {
    TUIOverlayMobileStyleType headerStyle = title.isEmpty
        ? TUIOverlayMobileStyleType.handle
        : TUIOverlayMobileStyleType.onlyTitle;

    TUIOverlayMobileStyle style =
        TUIOverlayMobileStyle(style: headerStyle, title: title);

    return TUIMobileOverlayHeader(style: style);
  }

  Widget getMenuItemView(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);
    final colors = theme.colors;

    return Container(
      color: colors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: menuItems.map((item) {
          if (item.index != 0) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: verticalGap),
                  Padding(
                    padding: EdgeInsets.all(
                        padding), // Apply padding of 16 pixels on all sides
                    child: item.view,
                  ),
                ]);
          } else {
            return Padding(
              padding: EdgeInsets.all(
                  padding), // Apply padding of 16 pixels on all sides
              child: item.view,
            );
          }
        }).toList(),
      ),
    );
  }

  Widget getFooterView(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);
    final colors = theme.colors;

    TUIOverlayFooterAction closeButton = TUIOverlayFooterAction(
        icon: FluentIcons.dismiss_24_regular,
        handler: () {
          print("close tapped");
        });

    return TUIMobileOverlayFooter(actions: [closeButton]);
  }
}

class MenuItem {
  final TUIMenuItem view;
  final int index;

  const MenuItem({required this.view, required this.index});
}
