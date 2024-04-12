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
  final List<TUIMenuItem> menuItems;

  const TUIMobileOverlayMenu({
    super.key,
    required this.title,
    required this.action,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        children: menuItems.indexed.map((item) {
          if (item.$1 != 0) {
            return Padding(
              padding: EdgeInsets.all(
                padding,
              ), // Apply padding of 16 pixels on all sides
              child: item.$2,
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(
                padding,
              ), // Apply padding of 16 pixels on all sides
              child: item.$2,
            );
          }
        }).toList(),
      ),
    );
  }

  Widget getFooterView(BuildContext context) {
    TUIOverlayFooterAction closeButton = TUIOverlayFooterAction(
        icon: FluentIcons.dismiss_24_regular,
        handler: () {
          Navigator.of(context).pop();
        });

    return TUIMobileOverlayFooter(actions: [closeButton]);
  }
}
