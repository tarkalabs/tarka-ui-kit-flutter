import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/colors.dart';
import 'package:tarka_ui/styles/spacing.dart';
import 'package:tarka_ui/styles/symbols.dart';
import 'package:tarka_ui/styles/theme.dart';

enum TUISnackBarType {
  success,
  information,
  warning,
  error;

  Color _getBackgroundColor(TUIColors colors) {
    switch (this) {
      case success:
        return colors.success;
      case information:
        return colors.secondary;
      case warning:
        return colors.warning;
      case error:
        return colors.error;
    }
  }

  Color _getForegroundColor(TUIColors colors) {
    switch (this) {
      case success:
        return colors.onSuccess;
      case information:
        return colors.onSecondary;
      case warning:
        return colors.onWarning;
      case error:
        return colors.onError;
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

class TUISnackBarAction {
  final String label;
  final VoidCallback onActionPressed;
  final bool _isDismissed;

  TUISnackBarAction({required this.label, required this.onActionPressed}) : _isDismissed = false;

  TUISnackBarAction.dismiss(this.label)
      : onActionPressed = (() => {}),
        _isDismissed = true;
}

class TUISnackBar extends SnackBar {
  TUISnackBar({
    Key? key,
    required BuildContext context,
    TUISnackBarType type = TUISnackBarType.information,
    required String message,
    TUISnackBarAction? action,
    Duration? duration,
    VoidCallback? onVisible,
  }) : super(
            key: key,
            elevation: 0,
            duration: duration ?? const Duration(seconds: 4),
            backgroundColor:
                type._getBackgroundColor(TUITheme.of(context).colors),
            behavior: SnackBarBehavior.floating,
            content: _getWidget(context, type, message, action),
            onVisible: onVisible,
            shape: const StadiumBorder());

  static Widget _getWidget(BuildContext context, TUISnackBarType type,
      String message, TUISnackBarAction? action) {
    TUIThemeData themeData = TUITheme.of(context);
    return Row(
      children: [
        Icon(type._getIconData(),
            color: type._getForegroundColor(themeData.colors)),
        const SizedBox(width: TUISpacing.halfHorizontal),
        Expanded(
            child: Text(
          message,
          style: themeData.typography.body6
              .copyWith(color: type._getForegroundColor(themeData.colors)),
        )),
        if (action != null) ...[
          const SizedBox(width: TUISpacing.halfHorizontal),
          TextButton(
              onPressed: action._isDismissed
                  ? () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(
                          reason: SnackBarClosedReason.dismiss);
                    }
                  : action.onActionPressed,
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      type._getBackgroundColor(themeData.colors)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      type._getForegroundColor(themeData.colors)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 18, right: 18)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const StadiumBorder())),
              child: Text(
                action.label,
                textAlign: TextAlign.center,
                style: themeData.typography.button7.copyWith(
                    color: type._getBackgroundColor(themeData.colors)),
              ))
        ]
      ],
    );
  }
}
