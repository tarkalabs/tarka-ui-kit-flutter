import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/icon_button.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIInputField is a text input field that allows users to enter text.
///
///   Example:
///   ```dart
///   TUIInputField(
///     hintText: 'Hint Text',
///     labelText: 'Label',
///     prefixText: 'Prefix',
///     suffixText: 'Suffix',
///     prefixIcon: Icons.add,
///     suffixIcon: Icons.remove,
///     obscureText: true,
///     controller: TextEditingController(),
///     keyboardType: TextInputType.text,
///     textInputAction: TextInputAction.done,
///     onChanged: (value) {},
///     onEditingComplete: () {},
///     onSubmitted: (value) {},
///   )
///   ```
class TUIInputField extends StatelessWidget {
  final bool enabled;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final TUITextFieldStartEndItem? prefix;
  final TUITextFieldStartEndItem? suffix;
  final bool obscureText;
  final String obscuringCharacter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool canRequestFocus;
  final bool? enableInteractiveSelection;
  final MouseCursor? mouseCursor;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;

  const TUIInputField({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    this.hintText,
    this.labelText = 'Label',
    this.errorText,
    this.helperText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.canRequestFocus = true,
    this.enableInteractiveSelection,
    this.mouseCursor,
  })  : assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0);

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final (prefixIcon, prefixIconConstraints) =
        _convertStartEndItemToWidget(prefix, theme);
    final (suffixIcon, suffixIconConstraints) =
        _convertStartEndItemToWidget(suffix, theme);
    return TextField(
        mouseCursor: mouseCursor,
        canRequestFocus: canRequestFocus,
        enableInteractiveSelection: enableInteractiveSelection,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        style: theme.typography.lg.copyWith(color: theme.colors.inputText),
        onTap: onTap,
        readOnly: readOnly,
        expands: expands,
        enabled: enabled,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        textCapitalization: textCapitalization,
        textDirection: textDirection,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colors.inputBackground,
          hintText: hintText,
          hintStyle:
              theme.typography.lg.copyWith(color: theme.colors.inputTextDim),
          labelText: labelText,
          labelStyle:
              theme.typography.lg.copyWith(color: theme.colors.inputTextDim),
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          errorText: errorText,
          helperText: helperText,
          errorStyle:
              theme.typography.sm.copyWith(color: theme.colors.inputText),
          helperStyle:
              theme.typography.sm.copyWith(color: theme.colors.inputText),
          focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.primary)),
          disabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.inputBackground)),
          enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.inputBackground)),
          border: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.inputBackground)),
          errorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.error)),
          focusedErrorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: theme.colors.error)),
        ));
  }

  (Widget?, BoxConstraints?) _convertStartEndItemToWidget(
      TUITextFieldStartEndItem? item, TUIThemeData theme) {
    if (item == null) {
      return (null, null);
    }
    switch (item._type) {
      case _StartEndItemType.text:
        return (
          Align(
            widthFactor: 1,
            heightFactor: 1,
            child: Text(
              item.text!,
              style: theme.typography.lg
                  .copyWith(color: theme.colors.inputTextDim),
            ),
          ),
          null
        );
      case _StartEndItemType.icon:
        return (
          Icon(
            item.icon!,
            size: 24,
          ),
          null
        );
      case _StartEndItemType.iconButton:
        return (
          TUIIconButton(
              type: item.buttonType!,
              size: TUIIconButtonSize.px40,
              onPressed: item.onButtonTap!,
              iconData: item.icon!),
          null
        );
    }
  }
}

class TUITextFieldStartEndItem {
  final IconData? icon;
  final String? text;
  final TUIIconButtonType? buttonType;
  final VoidCallback? onButtonTap;
  final _StartEndItemType _type;

  const TUITextFieldStartEndItem.text(this.text)
      : icon = null,
        buttonType = null,
        onButtonTap = null,
        _type = _StartEndItemType.text;

  const TUITextFieldStartEndItem.icon(this.icon)
      : text = null,
        buttonType = null,
        onButtonTap = null,
        _type = _StartEndItemType.icon;

  const TUITextFieldStartEndItem.iconButton(
      {required this.icon,
      required this.onButtonTap,
      this.buttonType = TUIIconButtonType.ghost})
      : text = null,
        _type = _StartEndItemType.iconButton;
}

enum _StartEndItemType {
  text,
  icon,
  iconButton;
}
