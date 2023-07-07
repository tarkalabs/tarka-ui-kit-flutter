import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/default_colors.dart';
import 'package:tarka_ui/styles/spacing.dart';
import 'package:tarka_ui/styles/symbols.dart';
import 'package:tarka_ui/styles/text_style.dart';

enum TUISnackBarType {
  success,
  information,
  warning,
  error;

  Color _getBackgroundColor() {
    switch (this) {
      case success:
        return TUIDefaultColors.success;
      case information:
        return TUIDefaultColors.secondary;
      case warning:
        return TUIDefaultColors.warning;
      case error:
        return TUIDefaultColors.error;
    }
  }

  Color _getForegroundColor() {
    switch (this) {
      case success:
        return TUIDefaultColors.onSuccess;
      case information:
        return TUIDefaultColors.onSecondary;
      case warning:
        return TUIDefaultColors.onWarning;
      case error:
        return TUIDefaultColors.onError;
    }
  }

  IconData _getIconData() {
    switch (this) {
      case success:
        return TUISymbol.successCheckMark;
      case information:
        return TUISymbol.information;
      case warning:
        return TUISymbol.warning;
      case error:
        return TUISymbol.error;
    }
  }
}

class TUISnackBar {
  const TUISnackBar({
    this.key,
    this.type = TUISnackBarType.information,
    required this.message,
    this.action = true,
    this.actionLabel,
    this.duration,
    this.onPressed,
  });

  final Key? key;
  final TUISnackBarType type;
  final String message;
  final bool action;
  final String? actionLabel;
  final Duration? duration;
  final VoidCallback? onPressed;

  SnackBar call() {
    final Widget content = Row(
      children: [
        Icon(type._getIconData(), color: type._getForegroundColor()),
        const SizedBox(width: TUISpacing.halfHorizontal),
        Expanded(
            child: Text(
          message,
          style: TUITextStyle.body6.copyWith(color: type._getForegroundColor()),
        )),
        if (action) ...[
          const SizedBox(width: TUISpacing.halfHorizontal),
          TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      type._getBackgroundColor()),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      type._getForegroundColor()),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 18, right: 18)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ))),
              child: Text(
                actionLabel ?? "",
                textAlign: TextAlign.center,
                style: TUITextStyle.button7
                    .copyWith(color: type._getBackgroundColor()),
              ))
        ]
      ],
    );

    return SnackBar(
      key: key,
      elevation: 0,
      duration: duration ?? const Duration(seconds: 4),
      backgroundColor: type._getBackgroundColor(),
      behavior: SnackBarBehavior.floating,
      content: content,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
    );
  }
}
