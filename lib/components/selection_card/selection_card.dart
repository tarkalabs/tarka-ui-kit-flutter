import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarka_ui/components/badge/badge.dart';
import '../../styles/theme.dart';

class TUISelectionCardStyle {
  final String title;
  final List<String>? description;
  final String footer;

  TUISelectionCardStyle({
    required this.title,
    this.description,
    this.footer = "",
  });
}

class TUISelectionCard extends StatelessWidget {
  final bool isSelected;
  final bool showChevron;
  final TUISelectionCardStyle style;
  final Icon? icon;
  final int? badgeCount;
  final Color? badgeColor;
  final bool isHovered;
  final Function? action;

  TUISelectionCard({
    Key? key,
    required this.style,
    this.isSelected = false,
    this.showChevron = false,
    this.icon,
    this.badgeCount,
    this.badgeColor,
    this.isHovered = false,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);

    return GestureDetector(
      onTap: () {
        action?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: theme.colors.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getLeftSide(theme),
            getRightSide(theme),
          ],
        ),
      ),
    );
  }

  Row getLeftSide(TUIThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: getIcon(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style.title,
              style: theme.typography.body7,
            ),
            ...style.description!
                .map(
                  (e) => Text(e, style: theme.typography.heading6),
                )
                .toList(),
            getFooter(theme),
          ],
        ),
      ],
    );
  }

  Row getRightSide(TUIThemeData theme) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getBadgeColor(theme),
          ),
          child: Text(
            badgeCount != null ? badgeCount.toString() : "",
            style: theme.typography.body8.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Icon(FluentIcons.chevron_right_24_filled),
      ],
    );
  }

  getBadgeColor(TUIThemeData theme) {
    return badgeColor ?? theme.colors.tertiary;
  }

  getIcon() {
    return icon ?? const Icon(FluentIcons.guest_24_regular);
  }

  getFooter(TUIThemeData theme) {
    return style.footer.isNotEmpty
        ? Text(style.footer, style: theme.typography.body7)
        : Container();
  }
}
