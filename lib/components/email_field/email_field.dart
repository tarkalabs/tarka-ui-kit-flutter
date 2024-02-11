import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/text_style.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';


class TUIEmailField extends StatefulWidget {
  late final TUIEmailFieldLabel label;
  late List<String> emails;
  bool showSuffix;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  TUIEmailField({
    super.key,
    this.label = TUIEmailFieldLabel.to,
    required this.emails,
    this.showSuffix = false,
    this.onAdd,
    this.onRemove,
  });

  @override
  State<StatefulWidget> createState() => _TUIEmailFieldState();
}

class _TUIEmailFieldState extends State<TUIEmailField> {
  late List<String> _emails = [];
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  BorderSide borderSide = const BorderSide(
    width: 2.0,
    color: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
    _emails = widget.emails;
    _focusNode.addListener(onFocusChange);
    _emailController.addListener(onTextChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      TUIThemeData theme = TUITheme.of(context);
      borderSide = BorderSide(
        width: 1.0,
        color: theme.colors.background,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(onFocusChange);
    _focusNode.dispose();
    _emailController.dispose();
  }

  void onTextChanged() {
    String text = _emailController.text;
    if (text.contains(" ")) {
      _emails.add(text.split(" ")[0]);
      _emailController.text = "";
      setState(() {
        _emails = _emails;
      });
    }
  }

  void onSubmitted(String text) {
    String email;
    if (text.contains(" ")) {
      email = text.trim();
      _emails.add(email);
      setState(() {
        _emails = _emails;
      });
    } else {
      _emails.add(text);
      setState(() {
        _emails = _emails;
      });
      _emailController.text = "";
    }
  }

  void onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        TUIThemeData theme = TUITheme.of(context);
        borderSide = BorderSide(
          width: 2.0,
          color: theme.colors.primary,
        );
      });
    } else {
      setState(() {
        TUIThemeData theme = TUITheme.of(context);
        borderSide = BorderSide(
          width: 1.0,
          color: theme.colors.background,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: borderSide,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: _emails.isEmpty
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: getPrefix(context),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4.0,
                  runAlignment: WrapAlignment.start,
                  children: [
                    ..._emails.map((
                      email,
                    ) {
                      int idx = _emails.indexOf(email);
                      return getChip(email, theme, idx);
                    }),
                  ],
                ),
                TextField(
                  focusNode: _focusNode,
                  cursorHeight: 16.0,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: getTextFieldDecoration(theme, context),
                  onSubmitted: onSubmitted,
                ),
              ],
            ),
          ),
          widget.showSuffix ? getSuffix(theme) : Container(),
        ],
      ),
    );
  }

  Chip getChip(String e, TUIThemeData theme, int idx) {
    return Chip(
      label: Text(e),
      padding: const EdgeInsets.symmetric(
        vertical: 1.0,
        horizontal: 8.0,
      ),
      labelStyle: theme.typography.body7.copyWith(
        fontWeight: FontWeight.w600,
      ),
      labelPadding: EdgeInsets.zero,
      backgroundColor: theme.colors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      side: BorderSide(color: theme.colors.background),
      onDeleted: () {
        widget.onRemove?.call();
        _emails.removeAt(idx);
        setState(() {
          _emails = _emails;
        });
      },
      deleteIcon: const Icon(
        FluentIcons.dismiss_24_filled,
        color: Colors.black,
        size: 24.0,
      ),
    );
  }

  InputDecoration getTextFieldDecoration(
      TUIThemeData theme, BuildContext context) {
    return const InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }

  getSuffix(TUIThemeData theme) {
    double opacity = 1.0;

    return GestureDetector(
      onTap: () {
        widget.onAdd?.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8.0),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 600),
          child: Icon(
            FluentIcons.add_circle_24_regular,
            color: theme.colors.constantDark,
          ),
        ),
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
        ),
        // ..._emails.map((e) => getChip(e, theme)).toList(),
      ],
    );
  }
}

// class EmailEditingController extends TextEditingController {
//   @override
//   onChanged(String text) {}
// }

enum TUIEmailFieldLabel {
  to,
  cc,
  bcc;
}
