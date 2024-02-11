import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIAccordion extends StatefulWidget {
  final String title;
  final String subtitle;

  const TUIAccordion({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<TUIAccordion> createState() => _TUIAccordionState();
}

class _TUIAccordionState extends State<TUIAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: TUIDefaultColors.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(36.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          textColor: theme.colors.onSurface,
          iconColor: theme.colors.onSurface,
          collapsedTextColor: theme.colors.onSurface,
          collapsedIconColor: theme.colors.onSurface,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
            child: Text(
              widget.title,
              style: theme.typography.heading5,
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Icon(
              _isExpanded
                  ? FluentIcons.subtract_12_regular
                  : FluentIcons.add_12_regular,
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
              child: ListTile(
                title: Text(
                  widget.subtitle,
                  style: theme.typography.body6,
                ),
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
        ));
  }
}
