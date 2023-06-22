import 'package:flutter/material.dart';

import '../../styles/default_colors.dart';
import '../../styles/theme.dart';

class BreadCrumb extends StatelessWidget {
  final Function(int) onTap;
  final List<String> titles;

  const BreadCrumb({
    Key? key,
    required this.titles,
    required this.onTap,
  }) : super(key: key);

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
              return Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  spacing: 4,
                  children: [
                    Text(
                      titles[index],
                      style: textStyle.button6.copyWith(
                        color: colors.inputTextDim,
                      ),
                    ),
                    Text(
                      "/",
                      style: textStyle.button6.copyWith(
                        color: colors.inputTextDim,
                      ),
                    )
                  ]);
            } else {
              return Text(
                titles[index],
                style: textStyle.button6.copyWith(
                  color: TUIDefaultColors.onSurface,
                ),
              );
            }
          }()),
        );
      }),
    );
  }
}
