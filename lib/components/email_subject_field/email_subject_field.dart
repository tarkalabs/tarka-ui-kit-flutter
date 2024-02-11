import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIEmailSubjectField extends StatefulWidget {
  final Function(String) onTextChanged;

  const TUIEmailSubjectField({super.key, required this.onTextChanged});

  @override
  State<TUIEmailSubjectField> createState() => _TUIEmailSubjectFieldState();
}

class _TUIEmailSubjectFieldState extends State<TUIEmailSubjectField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

  String enteredText = "";

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditing = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);

    TextStyle labelTextStyle = theme.typography.body7.copyWith(
      color: theme.colors.outline,
    );

    TextStyle textStyle = theme.typography.heading7;

    return TextField(
      controller: _controller,
      style: textStyle,
      onChanged: (text) {
        setState(() {
          enteredText = text;
          widget.onTextChanged(text);
        });
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: (_isEditing || enteredText.isNotEmpty) ? '' : 'Subject',
        labelStyle: labelTextStyle,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colors.surfaceVariantHover, // Color of the underline
            width: 0.5, // Thickness of the underline
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colors.surfaceVariantHover,
            width: 0.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colors.surfaceVariantHover,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
