import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUISelectionCardStyle widget can be used to display a selection of items.
///
/// Example:
/// ```dart
/// TUISelectionCard(
///   style: TUISelectionCardStyle(
///     title: "Title",
///     description: ["Description 1", "Description 2"],
///     footer: "Footer",
///   ),
///   isSelected: true,
///   showChevron: true,
///   icon: FluentIcons.guest_24_regular,
///   badgeCount: 1,
///   badgeColor: Colors.red,
///   isHovered: true,
///   action: () {
///     print("Card clicked");
///   },
/// )
/// ```
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
  final IconData? icon;
  final int? badgeCount;
  final Color? badgeColor;
  final bool isHovered;
  final Function? action;

  const TUISelectionCard({
    super.key,
    required this.style,
    this.isSelected = false,
    this.showChevron = false,
    this.icon,
    this.badgeCount,
    this.badgeColor,
    this.isHovered = false,
    this.action,
  });

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
          color: getBackgroundColor(theme),
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

  getBackgroundColor(TUIThemeData theme) {
    if (!isSelected && !isHovered) {
      return theme.colors.surface;
    }

    if (!isSelected && !isHovered) {
      return theme.colors.surfaceHover;
    }

    if (isSelected && !isHovered) {
      return theme.colors.primaryAlt;
    }

    if (isSelected && isHovered) {
      return theme.colors.primaryAltHover;
    }
  }

  Row getLeftSide(TUIThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: getIcon(theme),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style.title,
              style: theme.typography.body7,
            ),
            ...style.description!.map(
              (e) => Text(e, style: theme.typography.heading6),
            ),
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

  getIcon(TUIThemeData theme) {
    return Icon(
      icon ?? FluentIcons.guest_24_regular,
      color: theme.colors.secondary,
    );
  }

  getFooter(TUIThemeData theme) {
    return style.footer.isNotEmpty
        ? Text(style.footer, style: theme.typography.body7)
        : Container();
  }
}
