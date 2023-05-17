import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            children: [
          const Text("Heading1", style: TKTextStyle.heading1),
          const Text("Heading2", style: TKTextStyle.heading2),
          const Text("Heading3", style: TKTextStyle.heading3),
          const Text("Heading4", style: TKTextStyle.heading4),
          const Text("Heading5", style: TKTextStyle.heading5),
          const Text("Heading6", style: TKTextStyle.heading6),
          const Text("Heading7", style: TKTextStyle.heading7),
          const Text("Body5", style: TKTextStyle.body5),
          const Text("Body6", style: TKTextStyle.body6),
          const Text("Body7", style: TKTextStyle.body7),
          const Text("Body8", style: TKTextStyle.body8),
          const Text("Button6", style: TKTextStyle.button6),
          const Text("Button7", style: TKTextStyle.button7),
          const Text("Button8", style: TKTextStyle.button8),
          TKButton(
            label: "Primary Button",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TKButtonType.primary,
            onPressed: () {},
          ),
          TKButton(
            label: "Secondary Button",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TKButtonType.secondary,
            onPressed: () {},
          ),
          TKButton(
            label: "Outlined Button",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TKButtonType.outlined,
            onPressed: () {},
          ),
          TKButton(
            label: "Ghost Button",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TKButtonType.ghost,
            onPressed: () {},
          ),
          TKButton(
            label: "Danger Button",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TKButtonType.danger,
            onPressed: () {},
          )
        ]));
  }
}
