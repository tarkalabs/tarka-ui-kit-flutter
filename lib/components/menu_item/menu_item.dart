import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

class TUIMenuItemProperties {
  late String title;
  late TUIMenuItemStyle style;
  late TUIMenuItemState state;

  TUIMenuItemProperties({
    required this.title,
    required this.style,
    this.state = TUIMenuItemState.unchecked,
  });
}

class TUIMenuItem extends StatefulWidget {
  final TUIMenuItemProperties item;
  final bool backgroundDark; // for hover
  final Function(TUIMenuItemState)? action;
  final Function(TUIMenuItemState)? onLeftTap;
  final Function(TUIMenuItemState)? onRightTap;

  const TUIMenuItem({
    Key? key,
    required this.item,
    this.backgroundDark = false,
    this.onLeftTap,
    this.onRightTap,
    this.action,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TUIMenuItemState();
}

class _TUIMenuItemState extends State<TUIMenuItem> {
  TUIMenuItemState state = TUIMenuItemState.unchecked;

  @override
  void initState() {
    super.initState();
    state = widget.item.state;
    _setState(TUIMenuItemTapped.none);
  }

  _setState(TUIMenuItemTapped tapped) {
    // if both icon are displayed
    if (widget.item.style == TUIMenuItemStyle.both) {
      setState(() {
        if (state == TUIMenuItemState.unchecked) {
          if (tapped == TUIMenuItemTapped.left) {
            state = TUIMenuItemState.leftChecked;
          } else if (tapped == TUIMenuItemTapped.right) {
            state = TUIMenuItemState.rightChecked;
          }
        } else if (state == TUIMenuItemState.leftChecked) {
          if (tapped == TUIMenuItemTapped.left) {
            state = TUIMenuItemState.unchecked;
          } else if (tapped == TUIMenuItemTapped.right) {
            state = TUIMenuItemState.bothChecked;
          }
        } else if (state == TUIMenuItemState.rightChecked) {
          if (tapped == TUIMenuItemTapped.right) {
            state = TUIMenuItemState.unchecked;
          } else if (tapped == TUIMenuItemTapped.left) {
            state = TUIMenuItemState.bothChecked;
          }
        } else if (state == TUIMenuItemState.bothChecked) {
          if (tapped == TUIMenuItemTapped.left) {
            state = TUIMenuItemState.rightChecked;
          } else if (tapped == TUIMenuItemTapped.right) {
            state = TUIMenuItemState.leftChecked;
          }
        }
      });
    }

    // if only left is displayed
    if (tapped == TUIMenuItemTapped.left &&
        widget.item.style == TUIMenuItemStyle.onlyLeft) {
      setState(() {
        if (state == TUIMenuItemState.leftChecked) {
          state = TUIMenuItemState.unchecked;
        } else {
          state = TUIMenuItemState.leftChecked;
        }
      });
    }

    // if only right is displayed
    if (tapped == TUIMenuItemTapped.right &&
        widget.item.style == TUIMenuItemStyle.onlyRight) {
      setState(() {
        if (state == TUIMenuItemState.rightChecked) {
          state = TUIMenuItemState.unchecked;
        } else {
          state = TUIMenuItemState.rightChecked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    Color color = Colors.transparent;

    if (widget.backgroundDark) {
      if (state == TUIMenuItemState.unchecked) {
        color = theme.colors.background;
      } else {
        color = theme.colors.success.withOpacity(0.3);
      }
    }

    if (!widget.backgroundDark) {
      if (state == TUIMenuItemState.unchecked) {
        color = Colors.transparent;
      } else {
        color = theme.colors.success.withOpacity(0.1);
      }
    }

    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          onTap: () {
            setBgOnAction();
            widget.action?.call(state);
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(color: color),
            child: Row(
              mainAxisAlignment: getMainAxisAlignment(),
              children: [
                getLeftIcon(theme),
                Expanded(
                  child: Container(
                    padding: getTextPadding(),
                    child: Text(
                      widget.item.title,
                      style: theme.typography.body6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // getSpacer(),
                getRightIcon(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setBgOnAction() {
    setState(() {
      if (widget.item.style == TUIMenuItemStyle.onlyLeft) {
        if (state == TUIMenuItemState.leftChecked) {
          state = TUIMenuItemState.unchecked;
        } else {
          state = TUIMenuItemState.leftChecked;
        }
      } else if (widget.item.style == TUIMenuItemStyle.onlyRight) {
        if (state == TUIMenuItemState.rightChecked) {
          state = TUIMenuItemState.unchecked;
        } else {
          state = TUIMenuItemState.rightChecked;
        }
      } else {
        if (state == TUIMenuItemState.unchecked) {
          state = TUIMenuItemState.bothChecked;
        } else {
          state = TUIMenuItemState.unchecked;
        }
      }
    });
  }

  getTextPadding() {
    if (widget.item.style == TUIMenuItemStyle.onlyRight) {
      return const EdgeInsets.only(left: 24.0);
    }

    return const EdgeInsets.all(0.0);
  }

  getSpacer() {
    if (widget.item.style == TUIMenuItemStyle.both ||
        widget.item.style == TUIMenuItemStyle.onlyRight) {
      return const Spacer();
    }

    return const SizedBox(
      width: 0,
    );
  }

  getMainAxisAlignment() {
    return switch (widget.item.style) {
      TUIMenuItemStyle.none => MainAxisAlignment.center,
      TUIMenuItemStyle.both => MainAxisAlignment.start,
      TUIMenuItemStyle.onlyLeft => MainAxisAlignment.start,
      TUIMenuItemStyle.onlyRight => MainAxisAlignment.start,
    };
  }

  getPadding() {
    if (widget.item.style == TUIMenuItemStyle.none) {
      return const EdgeInsets.symmetric(vertical: 9.0, horizontal: 0.0);
    }

    return const EdgeInsets.all(0.0);
  }

  List<Icon> getIcon(TUIThemeData theme) {
    List<Icon> iconList = [
      Icon(
        FluentIcons.circle_24_regular,
        color: theme.colors.onSurface,
      ),
      Icon(
        FluentIcons.circle_24_regular,
        color: theme.colors.onSurface,
      ),
    ];

    if (state == TUIMenuItemState.unchecked) {
      iconList = [
        Icon(
          FluentIcons.circle_24_regular,
          color: theme.colors.onSurface,
        ),
        Icon(
          FluentIcons.circle_24_regular,
          color: theme.colors.onSurface,
        ),
      ];
    }

    if (state == TUIMenuItemState.leftChecked) {
      iconList = [
        Icon(
          FluentIcons.checkmark_24_filled,
          color: theme.colors.success,
        ),
        Icon(
          FluentIcons.circle_24_regular,
          color: theme.colors.onSurface,
        ),
      ];
    }

    if (state == TUIMenuItemState.rightChecked) {
      iconList = [
        Icon(
          FluentIcons.circle_24_regular,
          color: theme.colors.onSurface,
        ),
        Icon(
          FluentIcons.checkmark_24_filled,
          color: theme.colors.success,
        ),
      ];
    }

    if (state == TUIMenuItemState.bothChecked) {
      iconList = [
        Icon(
          FluentIcons.checkmark_24_filled,
          color: theme.colors.success,
        ),
        Icon(
          FluentIcons.checkmark_24_filled,
          color: theme.colors.success,
        ),
      ];
    }

    return iconList;
  }

  getLeftIcon(TUIThemeData theme) {
    if (widget.item.style == TUIMenuItemStyle.onlyLeft ||
        widget.item.style == TUIMenuItemStyle.both) {
      return GestureDetector(
        onTap: () {
          _setState(TUIMenuItemTapped.left);
          widget.onLeftTap?.call(state);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 16.0),
          child: getIcon(theme)[0],
        ),
      );
    }

    return Container();
  }

  getRightIcon(TUIThemeData theme) {
    if (widget.item.style == TUIMenuItemStyle.onlyRight ||
        widget.item.style == TUIMenuItemStyle.both) {
      return GestureDetector(
        onTap: () {
          _setState(TUIMenuItemTapped.right);
          widget.onRightTap?.call(state);
        },
        child: Container(
          padding: EdgeInsets.zero,
          child: getIcon(theme)[1],
        ),
      );
    }

    return Container();
  }
}

enum TUIMenuItemStyle {
  none(0),
  onlyLeft(1),
  onlyRight(2),
  both(3);

  const TUIMenuItemStyle(this.value);
  final num value;

  static TUIMenuItemStyle getByValue(num i) {
    return TUIMenuItemStyle.values.firstWhere((x) => x.value == i);
  }
}

enum TUIMenuItemState {
  unchecked(0),
  leftChecked(1),
  rightChecked(2),
  bothChecked(3);

  const TUIMenuItemState(this.value);
  final num value;

  static TUIMenuItemState getByValue(num i) {
    return TUIMenuItemState.values.firstWhere((x) => x.value == i);
  }
}

enum TUIMenuItemTapped {
  left(0),
  right(1),
  none(3);

  const TUIMenuItemTapped(this.value);
  final num value;

  static TUIMenuItemTapped getByValue(num i) {
    return TUIMenuItemTapped.values.firstWhere((x) => x.value == i);
  }
}
