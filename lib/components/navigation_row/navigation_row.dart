import 'package:flutter/cupertino.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUINavigationRow widget to display a navigation row with title, icon and accessory view.
/*
Example:
```dart
TUINavigationRow(
  title: "Navigation Row",
  icon: CupertinoIcons.person,
  accessoryView: CupertinoButton(
    child: Text("Button"),
    onPressed: () {
      print("Button tapped");
    },
  ),
 */
class TUINavigationRow extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? accessoryView;
  final double? height;

  const TUINavigationRow({
    super.key,
    required this.title,
    this.icon,
    this.accessoryView,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = height ?? constraints.maxHeight;
        return Row(
          children: [
            getLeftView(context, icon, title, maxHeight),
          ],
        );
      },
    );
  }

  Widget getLeftView(
      BuildContext context,
      IconData? icon,
      String title,
      double maxHeight,
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
        overflow: maxHeight == double.infinity ? null : TextOverflow.ellipsis,
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
}