import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/button.dart';

class TUIMobileButtonBlock extends StatefulWidget {
  final TUIMobileButtonBlockStyle style;

  TUIMobileButtonBlock({
    super.key,
    required this.style,
  }) {}

  @override
  State<TUIMobileButtonBlock> createState() => _TUIMobileButtonBlockState();
}

class _TUIMobileButtonBlockState extends State<TUIMobileButtonBlock> {
  late double? _width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      _width = constraints.maxWidth;

      return SizedBox(
        width: _width ?? 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: (widget.style == Style.one)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: wrapInExpanded(widget.style.getButtons(_width ?? 0)),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> wrapInExpanded(List<Widget> children) {
    if (widget.style.style == Style.flexible) {
      return children;
    } else {
      return children.map((widget) => Expanded(child: widget)).toList();
    }
  }
}

class TUIMobileButtonBlockStyle {
  late TUIButton? left;
  late TUIButton? right;
  late TUIButton? button;
  late Widget? rightButtonWidget;
  final Style style;

  TUIMobileButtonBlockStyle({
    Key? key,
    required this.style,
    this.left,
    this.right,
    this.button,
  }) {
    if (style == Style.flexible) {
      assert((left != null) && (right != null));
    } else if (style == Style.two) {
      assert((left != null && right != null));
    } else {
      assert(button != null);
    }
  }

  List<Widget> getButtons(double width) {
    if ((right != null) && (style == Style.flexible)) {
      rightButtonWidget = Flexible(
        child: Container(
          constraints: BoxConstraints(minWidth: width),
          child: right,
        ),
      );
    } else {
      rightButtonWidget = right;
    }

    List<Widget> buttons = [left, button, rightButtonWidget]
        .where((widget) => widget != null)
        .cast<Widget>()
        .toList();

    return buttons;
  }
}

enum Style {
  one,
  two,
  flexible;
}
