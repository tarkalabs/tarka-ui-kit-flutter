import 'package:flutter/material.dart';
import 'package:tarka_ui/tarka_ui.dart';
import 'symbol.dart';

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
          TKAvatar(
            avatarSize: TKAvatarSize.xxl,
            avatarContent: TKAvatarContent(
              text: "IH",
              type: TKAvatarContentType.text,
            ),
          ),
          TKAvatar(
            avatarSize: TKAvatarSize.xl,
            avatarContent: TKAvatarContent(
              text: "IH",
              type: TKAvatarContentType.text,
            ),
          ),
          TKAvatar(
            avatarSize: TKAvatarSize.m,
            avatarContent: TKAvatarContent(
              type: TKAvatarContentType.icon,
              icon: Icon(Icons.construction),
            ),
            isBadged: true,
          ),
          TKAvatar(
            avatarSize: TKAvatarSize.xxl,
            avatarContent: TKAvatarContent(
              type: TKAvatarContentType.image,
              image: const TKImage(
                imageUrl:
                    "https://avatars.githubusercontent.com/u/16992520?v=4",
              ),
            ),
            isBadged: true,
          ),
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
          const SizedBox(height: 8),
          TKButton(
            label: "Primary Button",
            type: TKButtonType.primary,
            size: TKButtonSize.xs,
            onPressed: () {},
          ),
          TKButton(
            label: "Secondary Button",
            icon: Symbol.chevronDown.value,
            type: TKButtonType.secondary,
            size: TKButtonSize.s,
            iconAlignment: TKButtonIconAlignment.right,
            onPressed: () {},
          ),
          TKButton(
            label: "Outlined Button",
            icon: Symbol.chevronDown.value,
            type: TKButtonType.outlined,
            size: TKButtonSize.m,
            onPressed: () {},
          ),
          TKButton(
            label: "Ghost Button",
            icon: Symbol.chevronDown.value,
            type: TKButtonType.ghost,
            onPressed: () {},
          ),
          TKButton(
            label: "Danger Button",
            icon: Symbol.chevronDown.value,
            type: TKButtonType.danger,
            size: TKButtonSize.l,
            onPressed: () {},
          )
        ]));
  }
}
