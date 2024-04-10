import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class TUIMobileOverlayFooter extends StatelessWidget {
  final List<TUIOverlayFooterAction> actions;

  const TUIMobileOverlayFooter({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    TUIThemeData theme = TUITheme.of(context);
    final colors = theme.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 0,
          thickness: 1,
        ),
        Container(
          color: colors.surface,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: actions
                .map(
                  (action) => IconButton(
                    icon: Icon(action.icon),
                    onPressed: action.handler,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class TUIOverlayFooterAction {
  final IconData icon;
  final VoidCallback handler;

  TUIOverlayFooterAction({required this.icon, required this.handler});
}
