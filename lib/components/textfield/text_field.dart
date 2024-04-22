import 'package:flutter/material.dart';
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
  final String? prefixText;
  final String? suffixText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final Icon? suffixIcon;
  final Color? suffixIconColor;
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
    this.prefixText,
    this.suffixText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
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
    final suffixIconColor = this.suffixIconColor ?? theme.colors.inputText;
    final prefixIconColor = this.prefixIconColor ?? theme.colors.inputText;
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
        onTap: onTap,
        readOnly: readOnly,
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
              theme.typography.body6.copyWith(color: theme.colors.inputTextDim),
          labelText: labelText,
          labelStyle:
              theme.typography.body6.copyWith(color: theme.colors.inputTextDim),
          suffixText: suffixText,
          prefixText: prefixText,
          prefixIconColor: prefixIconColor,
          prefixIcon: prefixIcon ?? prefixIcon,
          suffixIconColor: suffixIconColor,
          suffixIcon: suffixIcon ?? suffixIcon,
          errorText: errorText,
          helperText: helperText,
          errorStyle:
              theme.typography.body7.copyWith(color: theme.colors.inputText),
          helperStyle:
              theme.typography.body7.copyWith(color: theme.colors.inputText),
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
}
