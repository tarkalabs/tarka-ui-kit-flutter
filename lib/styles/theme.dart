import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/colors.dart';
import 'package:tarka_ui/styles/typography.dart';

class TUITheme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const TUITheme({
    super.key,
    required this.data,
    required this.child,
  });

  /// Specifies the color and typography values for descendant widgets.
  final TUIThemeData data;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  static TUIThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_TUITheme>()!.data;
  }

  static TUIThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_TUITheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _TUITheme(
      data: data,
      //TODO add IconThem back when we add support for IconTheme
      // child: IconTheme(
      //   data: data.iconTheme,
      child: DefaultTextStyle(
        style: data.typography.body6,
        child: child,
      ),
      // ),
    );
  }
}

class _TUITheme extends InheritedTheme {
  const _TUITheme({
    required this.data,
    required super.child,
  });

  final TUIThemeData data;

  @override
  bool updateShouldNotify(covariant _TUITheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _TUITheme(data: data, child: child);
  }
}

@immutable
class TUIThemeData with Diagnosticable {
  final TUIColors colors;
  final TUITypography typography;
  final ButtonStyles buttonStyles;

  TUIThemeData(this.colors, this.typography)
      : buttonStyles = ButtonStyles.from(colors, typography);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TUIColors>("colors", colors))
      ..add(DiagnosticsProperty<TUITypography>("typography", typography))
      ..add(DiagnosticsProperty<ButtonStyles>("buttonStyles", buttonStyles));
  }
}
