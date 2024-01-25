import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '../../styles/text_style.dart';

class TUIEmailField extends StatefulWidget {
  late final TUIEmailFieldLabel label;
  late List<String> emails;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  TUIEmailField({
    Key? key,
    this.label = TUIEmailFieldLabel.to,
    required this.emails,
    this.onAdd,
    this.onRemove,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TUIEmailFieldState();
}

class _TUIEmailFieldState extends State<TUIEmailField> {
  late List<String> _emails = [];
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emails = widget.emails;
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42.0,
                  vertical: 0.0,
                ),
                child: Wrap(
                  children: _emails.map((e) => getChip(e, theme)).toList(),
                ),
              ),
              // Text("hello"),
              TextField(
                cursorHeight: 16.0,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: getTextFieldDecoration(theme, context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Chip getChip(String e, TUIThemeData theme) {
    return Chip(
      label: Text(e),
      padding: const EdgeInsets.symmetric(
        vertical: 1.0,
        horizontal: 8.0,
      ),
      labelPadding: EdgeInsets.zero,
      backgroundColor: theme.colors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      side: BorderSide(color: theme.colors.background),
      onDeleted: () {},
      deleteIcon: const Icon(
        FluentIcons.dismiss_24_filled,
        color: Colors.black,
        size: 24.0,
      ),
    );
  }

  InputDecoration getTextFieldDecoration(
      TUIThemeData theme, BuildContext context) {
    return InputDecoration(
      contentPadding: EdgeInsets.zero,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colors.tertiary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colors.background),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colors.primary),
      ),
      prefixIcon: getPrefix(context),
      suffixIcon: getSuffix(theme),
      // contentPadding: EdgeInsets.all(8.0),
    );
  }

  getSuffix(TUIThemeData theme) {
    bool isEmailNotEmpty = widget.emails.isNotEmpty;

    return IconButton(
      onPressed: widget.onAdd,
      iconSize: 24.0,
      padding: const EdgeInsets.all(0.0),
      alignment: isEmailNotEmpty ? Alignment.topCenter : Alignment.center,
      icon: Icon(
        FluentIcons.add_circle_24_regular,
        color: theme.colors.constantDark,
      ),
    );
  }

  Column getPrefix(context) {
    switch (widget.label) {
      case TUIEmailFieldLabel.to:
        return getTextWrappedInColumnForPrefix("To");
      case TUIEmailFieldLabel.cc:
        return getTextWrappedInColumnForPrefix("CC");
      case TUIEmailFieldLabel.bcc:
        return getTextWrappedInColumnForPrefix("BCC");
    }
  }

  Column getTextWrappedInColumnForPrefix(String label) {
    bool isEmailNotEmpty = widget.emails.isNotEmpty;

    return Column(
      mainAxisAlignment:
          isEmailNotEmpty ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TUITextStyle.body7.copyWith(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

enum TUIEmailFieldLabel {
  to,
  cc,
  bcc;
}
