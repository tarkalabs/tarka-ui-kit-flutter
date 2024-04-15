import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';

/// TUIToggleSwitch that can be used to toggle between two states.
///
/// ```dart
/// Example:
/// TUIToggleSwitch(
///   value: _value,
///   onChanged: (value) {
///     setState(() {
///       _value = value;
///     });
///   },
/// )
/// ```
class TUIToggleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const TUIToggleSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _TUIToggleSwitchState();
}

class _TUIToggleSwitchState extends State<TUIToggleSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    final theme = TUITheme.of(context);
    final colors = theme.colors;

    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }

            if (widget.onChanged != null) {
              widget.value == false
                  ? widget.onChanged!(true)
                  : widget.onChanged!(false);
            }
          },
          child: Row(
            children: [
              Container(
                width: 40.0,
                height: 24.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: _circleAnimation!.value == Alignment.centerLeft
                      ? isEnabled()
                          ? colors.primary
                          : colors.disabledBackground
                      : isEnabled()
                          ? colors.surfaceVariant
                          : colors.disabledBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                  child: Container(
                      alignment: widget.value
                          ? ((Directionality.of(context) == TextDirection.rtl)
                              ? Alignment.centerLeft
                              : Alignment.centerRight)
                          : ((Directionality.of(context) == TextDirection.rtl)
                              ? Alignment.centerRight
                              : Alignment.centerLeft),
                      child: getThumb(context)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool isEnabled() {
    return widget.onChanged != null;
  }

  Widget getThumb(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getThumbColor(context),
      ),
      child: getThumbIcon(context),
    );
  }

  Color getThumbColor(BuildContext context) {
    final theme = TUITheme.of(context);
    final colors = theme.colors;

    return isEnabled()
        ? widget.value
            ? colors.constantLight
            : colors.constantDark
        : colors.disabledContent;
  }

  Widget getThumbIcon(BuildContext context) {
    final theme = TUITheme.of(context);
    final colors = theme.colors;

    if (widget.value) {
      return Icon(
        Icons.check,
        size: 16,
        color: isEnabled() ? colors.primary : colors.constantLight,
      );
    } else {
      return Icon(
        FluentIcons.dismiss_12_regular,
        size: 16,
        color: colors.constantLight,
      );
    }
  }
}
