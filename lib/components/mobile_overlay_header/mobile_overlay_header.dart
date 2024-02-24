import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/icon_button.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIMobileOverlayHeader is a widget that is used to create a header for the mobile overlay.
///
/// Example:
/// ```dart
/// TUIMobileOverlayHeader(
///   style: TUIOverlayMobileStyle(
///     style: TUIOverlayMobileStyleType.left,
///     title: "Title",
///     action: () {
///       print("Action");
///     },
///   ),
/// )
/// ```
class TUIMobileOverlayHeader extends StatelessWidget {
  final TUIOverlayMobileStyle style;
  const TUIMobileOverlayHeader({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    return Container(
      height: style.style == TUIOverlayMobileStyleType.handle ? 28 : 68,
      decoration: BoxDecoration(
        color: theme.colors.surface,
      ),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        List<Widget?> items = [];
        items.add(getBottomDivider(context, constraints.maxWidth));
        items.add(getTitleView(context));
        items.add(getBackButton());
        items.add(getRightView(context));
        items.add(getTopDivider(context, constraints.maxWidth));

        List<Widget> children =
            items.where((widget) => widget != null).cast<Widget>().toList();

        return Stack(children: children);
      }),
    );
  }

  Widget? getTopDivider(BuildContext context, double width) {
    final theme = TUITheme.of(context);

    return SizedBox(
      height: 4,
      width: width,
      child: Center(
        child: Container(
          height: 4,
          width: 68,
          decoration: BoxDecoration(
              color: theme.colors.surfaceVariant,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              )),
        ),
      ),
    );
  }

  Widget? getTitleView(BuildContext context) {
    final theme = TUITheme.of(context);
    TextStyle textStyle = theme.typography.heading5;

    return (style.style == TUIOverlayMobileStyleType.handle)
        ? null
        : Center(
            child: Text(
              style.title ?? "",
              style: textStyle,
            ),
          );
  }

  Widget? getRightView(BuildContext context) {
    return (style.style == TUIOverlayMobileStyleType.right)
        ? Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width, // Set the width to the screen width
              child: Row(
                children: [
                  const Spacer(),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Center(
                      child: TUIIconButton(
                        type: TUIIconButtonType.ghost,
                        size: TUIIconButtonSize.px40,
                        iconData: style.getIcon(),
                        onPressed: style.action,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : null;
  }

  Widget? getBackButton() {
    return (style.style == TUIOverlayMobileStyleType.left)
        ? SizedBox(
            width: TUIIconButtonSize.px40.iconSize,
            child: Center(
              child: TUIIconButton(
                type: TUIIconButtonType.ghost,
                size: TUIIconButtonSize.px40,
                iconData: FluentIcons.chevron_left_20_regular,
                onPressed: style.action,
              ),
            ),
          )
        : null;
  }

  Widget? getBottomDivider(BuildContext context, double width) {
    final theme = TUITheme.of(context);

    return (style.style == TUIOverlayMobileStyleType.handle)
        ? null
        : Column(
            children: [
              const Spacer(),
              Container(
                width: width,
                height: 1,
                decoration:
                    BoxDecoration(color: theme.colors.surfaceVariantHover),
              )
            ],
          );
  }
}

class TUIOverlayMobileStyle {
  final TUIOverlayMobileStyleType style;
  late String? title;
  late Function()? action;
  late IconData? icon;

  IconData getIcon() {
    if (icon != null) {
      return icon!;
    } else {
      return FluentIcons.accessibility_16_regular;
    }
  }

  TUIOverlayMobileStyle(
      {required this.style, this.title, this.action, this.icon}) {
    if (style == TUIOverlayMobileStyleType.handle) {
      assert((title == null) && (action == null) && (icon == null));
    } else if (style == TUIOverlayMobileStyleType.onlyTitle) {
      assert((title != null) && (action == null) && (icon == null));
    } else if (style == TUIOverlayMobileStyleType.left) {
      assert((title != null) && (action != null) && (icon == null));
    } else if (style == TUIOverlayMobileStyleType.right) {
      assert((title != null) && (action != null) && (icon != null));
    }
  }
}

enum TUIOverlayMobileStyleType {
  handle,
  onlyTitle,
  left,
  right;
}
