import 'package:flutter/material.dart';

import '../../styles/default_colors.dart';
import '../../styles/text_style.dart';

class BreadCrumb extends StatelessWidget {
  const BreadCrumb({Key? key, required this.titles, required this.onTap})
      : super(key: key);
  final Function(int) onTap;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
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
                      style: TUITextStyle.button6.copyWith(
                        color: TUIDefaultColors.disabledBackground
                            .withOpacity(0.7),
                      ),
                    ),
                    Text(
                      "/",
                      style: TUITextStyle.button6.copyWith(
                        color: TUIDefaultColors.disabledBackground
                            .withOpacity(0.7),
                      ),
                    )
                  ]);
            } else {
              return Text(
                titles[index],
                style: TUITextStyle.button6.copyWith(
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
