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
            children:  [
          TButton(
            label: "Hello",
            icon: FluentIcons.circle_12_filled,
            tButtonType: TButtonType.primary,
            onPressed: (){},
          ),
               TButton(
                label: "Hello",
                icon: FluentIcons.circle_12_filled,
                tButtonType: TButtonType.secondary,
                onPressed: (){},
              ),
              TButton(
                label: "Hello",
                icon: FluentIcons.circle_12_filled,
                tButtonType: TButtonType.outlined,
                onPressed: (){},
              ),
              TButton(
                label: "Hello",
                icon: FluentIcons.circle_12_filled,
                tButtonType: TButtonType.ghost,
                onPressed: (){},
              )
        ]));
  }
}
