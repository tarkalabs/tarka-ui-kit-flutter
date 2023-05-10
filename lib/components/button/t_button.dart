import 'package:flutter/material.dart';
import 'package:tarka_ui/colors/t_colors.dart';

enum TButtonType { primary, secondary, outlined, ghost }

class TButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final TButtonType tButtonType;
  final VoidCallback? onPressed;

  const TButton({
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
      case TButtonType.primary:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),
          onPressed: onPressed,
          child: child,
        );
      case TButtonType.secondary:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: TColors.secondary),
          onPressed: onPressed,
          child: child,
        );
      case TButtonType.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(),
          onPressed: onPressed,
          child: child,
        );
      case TButtonType.ghost:
        return TextButton(
          style: TextButton.styleFrom(backgroundColor: TColors.background),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}
