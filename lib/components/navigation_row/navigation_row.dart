import 'package:flutter/cupertino.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUINavigationRow extends StatelessWidget {
  final String title;
  late final IconData? icon;
  late final Widget? accessoryView;
  late final double? _height;

    TUINavigationRow({
    super.key,
    required this.title,
    this.icon,
    this.accessoryView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      _height = constraints.maxHeight;
      return Row(children: [getLeftView(context, icon, title)]);
    });
  }

  Widget getLeftView(
    BuildContext context,
    IconData? icon,
    String title,
  ) {
    final theme = TUITheme.of(context);

    TextStyle titleTextStyle = theme.typography.heading7.copyWith(
      color: theme.colors.onSurface,
    );

    List<Widget> leftViewItems = [];

    if (icon != null) {
      leftViewItems.add(SizedBox(
        width: 24,
        height: 24,
        child: Center(
          child: Icon(icon),
        ),
      ));

      leftViewItems.add(const SizedBox(width: 16));
    }

    Padding titleWidget = Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.left,
        overflow: getTextOverFlow(),
      ),
    );

    leftViewItems.add(Expanded(child: titleWidget));
    leftViewItems.add(
      const SizedBox(
        width: 8,
        height: 0,
      ),
    );

    if (accessoryView != null) {
      leftViewItems.add(accessoryView!);
    }

    return Expanded(
      child: Row(
        children: leftViewItems,
      ),
    );
  }

  TextOverflow? getTextOverFlow() {
    return _height == double.infinity ? null : TextOverflow.ellipsis;
  }
}
