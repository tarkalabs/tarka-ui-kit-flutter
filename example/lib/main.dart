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
            children: const [
          TButton(
            label: "Hello",
            icon: FluentIcons.access_time_24_regular,
            tButtonType: TButtonType.primary,
          ),
              TButton(
                label: "Hello",
                icon: FluentIcons.access_time_24_regular,
                tButtonType: TButtonType.secondary,
              ),
              TButton(
                label: "Hello",
                icon: FluentIcons.access_time_24_regular,
                tButtonType: TButtonType.outlined,
              ),
              TButton(
                label: "Hello",
                icon: FluentIcons.access_time_24_regular,
                tButtonType: TButtonType.ghost,
              )
        ]));
  }
}
