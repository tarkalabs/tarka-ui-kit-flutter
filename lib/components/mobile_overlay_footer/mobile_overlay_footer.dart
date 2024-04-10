import 'package:flutter/material.dart';

class TUIMobileOverlayFooter extends StatelessWidget {
  final List<TUIOverlayFooterAction> actions;

  const TUIMobileOverlayFooter({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 0,
          thickness: 1,
          color: Colors.grey,
        ),
        Container(
          color: Colors.grey.shade200,
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
