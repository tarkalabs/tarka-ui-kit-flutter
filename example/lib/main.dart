import 'package:flutter/material.dart';
import 'package:tarka_ui/tarka_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tarka Kit Show Case',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            TUIBadge(
              isNumbered: true,
              content: "12333",
              badgeSize: TUIBadgeSize.l,
            ),
            TUIBadge(
              isNumbered: true,
              content: "1",
              badgeSize: TUIBadgeSize.s,
            ),
            TUIBadge(
              isNumbered: true,
              content: "1",
              badgeSize: TUIBadgeSize.xs,
            ),
          ],
        ),
      ),
    );
  }
}

/*
Row(
          children: [
            TUIBadge(
              isNumbered: true,
              content: "1",
              badgeSize: TUIBadgeSize.l,
            ),
            TUIBadge(
              isNumbered: true,
              content: "1",
              badgeSize: TUIBadgeSize.s,
            ),
            TUIBadge(
              isNumbered: true,
              content: "1",
              badgeSize: TUIBadgeSize.xs,
            ),
            TUIBadge(
              isNumbered: true,
              content: "123",
              badgeSize: TUIBadgeSize.l,
            ),
            TUIBadge(
              isNumbered: true,
              content: "123",
              badgeSize: TUIBadgeSize.s,
            ),
            TUIBadge(
              isNumbered: true,
              content: "123",
              badgeSize: TUIBadgeSize.xs,
            ),
            TUIBadge(
              isNumbered: true,
              content: "12345",
              badgeSize: TUIBadgeSize.l,
            ),
            TUIBadge(
              isNumbered: true,
              content: "12345",
              badgeSize: TUIBadgeSize.s,
            ),
            TUIBadge(
              isNumbered: true,
              content: "12345",
              badgeSize: TUIBadgeSize.xs,
            ),
            TUIBadge(
              isNumbered: false,
              content: "12345",
              badgeSize: TUIBadgeSize.l,
            ),
            TUIBadge(
              isNumbered: false,
              content: "12345",
              badgeSize: TUIBadgeSize.s,
            ),
            TUIBadge(
              isNumbered: false,
              content: "12345",
              badgeSize: TUIBadgeSize.xs,
            ),
          ],
        ),

*/
