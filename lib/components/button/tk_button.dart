import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/tk_colors.dart';

enum TKButtonType { primary, secondary, outlined, ghost, danger }

class TKButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TKButtonType tButtonType;
  final VoidCallback? onPressed;

  const TKButton({
    super.key,
    required this.label,
    required this.icon,
    required this.tButtonType,
    this.onPressed,
  }) : assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) Icon(icon, size: 18.0),
        if (icon != null && label != null) const SizedBox(width: 8),
        if (label != null) Text(label!, textAlign: TextAlign.center),
      ],
    );
    switch (tButtonType) {
      case TKButtonType.primary:
        return TextButton(
          style: TextButton.styleFrom(backgroundColor: TKColors.primary,foregroundColor:TKColors.onPrimary ),
          onPressed: onPressed,
          child: child,
        );
      case TKButtonType.secondary:
        return TextButton(
          style: TextButton.styleFrom(backgroundColor: TKColors.secondary,foregroundColor: TKColors.onSecondary),
          onPressed: onPressed,
          child: child,
        );
      case TKButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: TKColors.onSurface),
          onPressed: onPressed,
          child: child,
        );
      case TKButtonType.ghost:
        return TextButton(
          style: TextButton.styleFrom(backgroundColor: TKColors.transparent,foregroundColor: TKColors.secondary),
          onPressed: onPressed,
          child: child,
        );
      case TKButtonType.danger:
        return TextButton(
          style: TextButton.styleFrom(backgroundColor: TKColors.error,foregroundColor: TKColors.onPrimary),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}
