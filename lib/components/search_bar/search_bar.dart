import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUISearchBar extends StatefulWidget {
  final bool showBackIcon;
  final bool showTrailingIcon;
  final String placeholder;
  final Function()? onBackAction;
  final Function()? onTrainlingButtonAction;
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final bool autofocus;

  TUISearchBar({
    super.key,
    this.showBackIcon = true,
    this.showTrailingIcon = false,
    this.placeholder = "Search",
    this.onBackAction,
    this.onTrainlingButtonAction,
    this.textEditingController,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  State<StatefulWidget> createState() => _TUISearchBarState();
}

class _TUISearchBarState extends State<TUISearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = widget.textEditingController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      width: MediaQuery.of(context).size.width,
      height: 48.0,
      decoration: BoxDecoration(
        color: theme.colors.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(75.0),
        ),
      ),
      child: Row(
        children: [
          getPrefixIcon(theme),
          Flexible(
            child: TextField(
              maxLines: 1,
              controller: _controller,
              style: theme.typography.body6,
              cursorHeight: 16.0,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) => widget.onChanged?.call(value),
              autofocus: widget.autofocus,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: InputBorder.none,
                isDense: true,
                contentPadding: getContentPadding(),
              ),
            ),
          ),
          getSuffixIcon(theme),
        ],
      ),
    );
  }

  getContentPadding() {
    EdgeInsets padding = EdgeInsets.zero;
    if (!widget.showBackIcon) {
      return padding.copyWith(left: 24.0);
    }
    return padding;
  }

  getSuffixIcon(TUIThemeData theme) {
    if (widget.showTrailingIcon) {
      return GestureDetector(
        onTap: () {
          _controller.text = "";
          widget.onTrainlingButtonAction?.call();
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FluentIcons.dismiss_24_filled,
            color: theme.colors.onSurface,
          ),
        ),
      );
    }
    return Container();
  }

  getPrefixIcon(TUIThemeData theme) {
    if (widget.showBackIcon) {
      return GestureDetector(
        onTap: () => widget.onBackAction?.call(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FluentIcons.chevron_left_24_filled,
            color: theme.colors.onSurface,
          ),
        ),
      );
    }
    return Container();
  }
}
