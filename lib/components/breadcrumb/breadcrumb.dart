import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIBreadCrumb is used to create a BreadCrumb with titles and onTap function.
///
///  Example:
///    ```dart
///  TUIBreadCrumb(
///    titles: ['Home', 'Library', 'Data'],
///    onTap: (index) {
///      print('Tapped on index: $index');
///    },
///  )
///  ```
class TUIBreadCrumb extends StatelessWidget {
  final Function(int) onTap;
  final List<String> titles;

  const TUIBreadCrumb({
    super.key,
    required this.titles,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final textStyle = theme.typography;
    final colors = theme.colors;

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8,
      direction: Axis.horizontal,
      children: List.generate(titles.length, (index) {
        bool shouldAddSlash = index != titles.length - 1;
        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: (() {
            // your code here
            if (shouldAddSlash) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titles[index],
                      style: textStyle.baseSemiBold.copyWith(
                        color: colors.inputTextDim,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "/",
                      style: textStyle.baseSemiBold.copyWith(
                        color: colors.inputTextDim,
                      ),
                    )
                  ]);
            } else {
              return Text(
                titles[index],
                style: textStyle.baseSemiBold.copyWith(
                  color: colors.onSurface,
                ),
              );
            }
          }()),
        );
      }),
    );
  }
}
