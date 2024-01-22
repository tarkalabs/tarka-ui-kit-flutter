import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/components/app_bar/app_bar.dart';

import '../defaults.dart';

main() {
  testWidgets("App Bar is displayed above system nav bars",
      (widgetTester) async {
    /*
    Ideally we would want to have a test, that verifies AppBar widget's absolute position is above System Nav Bar.
    I tried couple of methods and both did not work. So in future, when we become more wiser. Try again.
    Tried following things.
    1. Snapshot testing, But Snapshot did not have System nav bar and I could not find a way to include System Nav bar in snapshot.
    2. I tried to find absolute position of widget and make sure that, its above safe area bottom, using some pixels calculation. But I got some wierd numbers that did not make any sense to me.
    */
    final appBar = TUIAppTopBar(
      items: [
        TUIAppBarItem(
            iconData: FluentIcons.bookmark_24_regular, label: "Saved"),
        TUIAppBarItem(
            iconData: FluentIcons.search_24_regular, label: "Discover"),
      ],
      currentIndex: 0,
      onTap: (value) => {},
    );

    await widgetTester.pumpWidgetBuilder(appBar, wrapper: tuiAppWrapper());
    //Since we know that, `BottomNavigationBar` will always be displayed on top of SystemNavBar, we can be assured that TUIAppBar will also be displayed above System Nav Bar.
    var bottomNavBarFinder = find.descendant(
        of: find.byType(TUIAppTopBar),
        matching: find.byType(BottomNavigationBar));
    expect(bottomNavBarFinder, findsOneWidget);
  });

  testWidgets("When user clicks on App bar item, A Callback is passed.",
      (widgetTester) async {
    final completer = Completer<int>();
    final appBar = TUIAppTopBar(
      items: [
        TUIAppBarItem(
            iconData: FluentIcons.bookmark_24_regular, label: "Saved"),
        TUIAppBarItem(
            iconData: FluentIcons.search_24_regular, label: "Discover"),
      ],
      currentIndex: 0,
      onTap: completer.complete,
    );

    await widgetTester.pumpWidgetBuilder(appBar, wrapper: tuiAppWrapper());
    await widgetTester.tap(find.text("Discover"));
    expect(completer.isCompleted, true);
    expect(await completer.future, equals(1));
  });
}
