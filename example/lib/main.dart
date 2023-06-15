import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'symbol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TUIApp(
      theme: TUIThemeData(
          TUIColors(
            TUIDefaultColors.primary,
            TUIDefaultColors.onPrimary,
            TUIDefaultColors.primaryAlt,
            TUIDefaultColors.onPrimaryAlt,
            TUIDefaultColors.primaryHover,
            TUIDefaultColors.primaryAltHover,
            TUIDefaultColors.secondary,
            TUIDefaultColors.onSecondary,
            TUIDefaultColors.secondaryAlt,
            TUIDefaultColors.onSecondaryAlt,
            TUIDefaultColors.secondaryHover,
            TUIDefaultColors.secondaryAltHover,
            TUIDefaultColors.tertiary,
            TUIDefaultColors.onTertiary,
            TUIDefaultColors.tertiaryAlt,
            TUIDefaultColors.onTertiaryAlt,
            TUIDefaultColors.tertiaryHover,
            TUIDefaultColors.tertiaryAltHover,
            TUIDefaultColors.success,
            TUIDefaultColors.onSuccess,
            TUIDefaultColors.success10,
            TUIDefaultColors.success20,
            TUIDefaultColors.error,
            TUIDefaultColors.onError,
            TUIDefaultColors.error10,
            TUIDefaultColors.errorHover,
            TUIDefaultColors.warning,
            TUIDefaultColors.onWarning,
            TUIDefaultColors.warning10,
            TUIDefaultColors.warningHover,
            TUIDefaultColors.background,
            TUIDefaultColors.onBackground,
            TUIDefaultColors.outline,
            TUIDefaultColors.disabledContent,
            TUIDefaultColors.disabledBackground,
            TUIDefaultColors.disabledBackgroundHover,
            TUIDefaultColors.link,
            TUIDefaultColors.inputText,
            TUIDefaultColors.inputBackground,
            TUIDefaultColors.inputTextDim,
            TUIDefaultColors.surface,
            TUIDefaultColors.surface50,
            TUIDefaultColors.onSurface,
            TUIDefaultColors.surfaceVariant,
            TUIDefaultColors.surfaceHover,
            TUIDefaultColors.surfaceVariantHover,
          ),
          TUITypography(
            TUITextStyle.heading1,
            TUITextStyle.heading2,
            TUITextStyle.heading3,
            TUITextStyle.heading4,
            TUITextStyle.heading5,
            TUITextStyle.heading6,
            TUITextStyle.heading7,
            TUITextStyle.body5,
            TUITextStyle.body6,
            TUITextStyle.body7,
            TUITextStyle.body8,
            TUITextStyle.button6,
            TUITextStyle.button7,
            TUITextStyle.button8,
          )),
      darkTheme: TUIThemeData(
          TUIColors(
            TUIDefaultColors.primary,
            TUIDefaultColors.onPrimary,
            TUIDefaultColors.primaryAlt,
            TUIDefaultColors.onPrimaryAlt,
            TUIDefaultColors.primaryHover,
            TUIDefaultColors.primaryAltHover,
            TUIDefaultColors.secondary,
            TUIDefaultColors.onSecondary,
            TUIDefaultColors.secondaryAlt,
            TUIDefaultColors.onSecondaryAlt,
            TUIDefaultColors.secondaryHover,
            TUIDefaultColors.secondaryAltHover,
            TUIDefaultColors.tertiary,
            TUIDefaultColors.onTertiary,
            TUIDefaultColors.tertiaryAlt,
            TUIDefaultColors.onTertiaryAlt,
            TUIDefaultColors.tertiaryHover,
            TUIDefaultColors.tertiaryAltHover,
            TUIDefaultColors.success,
            TUIDefaultColors.onSuccess,
            TUIDefaultColors.success10,
            TUIDefaultColors.success20,
            TUIDefaultColors.error,
            TUIDefaultColors.onError,
            TUIDefaultColors.error10,
            TUIDefaultColors.errorHover,
            TUIDefaultColors.warning,
            TUIDefaultColors.onWarning,
            TUIDefaultColors.warning10,
            TUIDefaultColors.warningHover,
            TUIDefaultColors.background,
            TUIDefaultColors.onBackground,
            TUIDefaultColors.outline,
            TUIDefaultColors.disabledContent,
            TUIDefaultColors.disabledBackground,
            TUIDefaultColors.disabledBackgroundHover,
            TUIDefaultColors.link,
            TUIDefaultColors.inputText,
            TUIDefaultColors.inputBackground,
            TUIDefaultColors.inputTextDim,
            TUIDefaultColors.surface,
            TUIDefaultColors.surface50,
            TUIDefaultColors.onSurface,
            TUIDefaultColors.surfaceVariant,
            TUIDefaultColors.surfaceHover,
            TUIDefaultColors.surfaceVariantHover,
          ),
          TUITypography(
            TUITextStyle.heading1,
            TUITextStyle.heading2,
            TUITextStyle.heading3,
            TUITextStyle.heading4,
            TUITextStyle.heading5,
            TUITextStyle.heading6,
            TUITextStyle.heading7,
            TUITextStyle.body5,
            TUITextStyle.body6,
            TUITextStyle.body7,
            TUITextStyle.body8,
            TUITextStyle.button6,
            TUITextStyle.button7,
            TUITextStyle.button8,
          )),
      title: 'Tarka Kit Show Case',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            children: [
              const Text("Text Style", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const Text("Heading1", style: TUITextStyle.heading1),
              const Text("Heading2", style: TUITextStyle.heading2),
              const Text("Heading3", style: TUITextStyle.heading3),
              const Text("Heading4", style: TUITextStyle.heading4),
              const Text("Heading5", style: TUITextStyle.heading5),
              const Text("Heading6", style: TUITextStyle.heading6),
              const Text("Heading7", style: TUITextStyle.heading7),
              const Text("Body5", style: TUITextStyle.body5),
              const Text("Body6", style: TUITextStyle.body6),
              const Text("Body7", style: TUITextStyle.body7),
              const Text("Body8", style: TUITextStyle.body8),
              const Text("Button6", style: TUITextStyle.button6),
              const Text("Button7", style: TUITextStyle.button7),
              const Text("Button8", style: TUITextStyle.button8),
              const SizedBox(height: 8),
              const Text("Button", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              TUIButton(
                label: "Primary Button",
                type: TUIButtonType.primary,
                size: TUIButtonSize.xs,
                onPressed: () {},
              ),
              TUIButton(
                label: "Secondary Button",
                iconData: Symbol.chevronDown.value,
                type: TUIButtonType.secondary,
                size: TUIButtonSize.s,
                iconPosition: TUIButtonIconPosition.right,
                onPressed: () {},
              ),
              TUIButton(
                label: "Outlined Button",
                iconData: Symbol.chevronDown.value,
                type: TUIButtonType.outlined,
                size: TUIButtonSize.m,
                onPressed: () {},
              ),
              TUIButton(
                label: "Ghost Button",
                iconData: Symbol.chevronDown.value,
                type: TUIButtonType.ghost,
                size: TUIButtonSize.l,
                onPressed: () {},
              ),
              TUIButton(
                label: "Danger Button",
                iconData: Symbol.chevronDown.value,
                type: TUIButtonType.danger,
                size: TUIButtonSize.l,
                onPressed: () {},
              ),
              TUIButton(
                iconData: Symbol.hamburgerMenu.value,
                type: TUIButtonType.ghost,
                size: TUIButtonSize.l,
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              const Text("Avatar", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              TUIAvatar(
                avatarSize: TUIAvatarSize.xxl,
                avatarContent: TUIAvatarContent(
                  text: "TUI",
                  type: TUIAvatarContentType.text,
                ),
              ),
              TUIAvatar(
                avatarSize: TUIAvatarSize.xl,
                avatarContent: TUIAvatarContent(
                  text: "TUI",
                  type: TUIAvatarContentType.text,
                ),
              ),
              TUIAvatar(
                avatarSize: TUIAvatarSize.m,
                avatarContent: TUIAvatarContent(
                  type: TUIAvatarContentType.icon,
                  icon: Symbol.export.value,
                ),
                isBadged: true,
              ),
              TUIAvatar(
                avatarSize: TUIAvatarSize.xxl,
                backgroundColor: Colors.grey[200],
                avatarContent: TUIAvatarContent(
                  type: TUIAvatarContentType.image,
                  image: const TUIImage(
                    imageUrl: "https://avatars.githubusercontent.com/u/8043494?v=4",
                  ),
                ),
                isBadged: true,
              ),
              const SizedBox(height: 8),
              const Text("Divider", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.s),
              const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.m),
              const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.l),
              const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.xl),
              const SizedBox(
                height: 80,
                child: TUIDivider(
                  type: TUIDividerType.vertical,
                  verticalPadding: TUIDividerVerticalPadding.s,
                ),
              ),
              const SizedBox(height: 8),
              const Text("Badge", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    isNumbered: false,
                    badgeSize: TUIBadgeSize.l,
                  ),
                  TUIBadge(
                    isNumbered: false,
                    badgeSize: TUIBadgeSize.s,
                  ),
                  TUIBadge(
                    isNumbered: false,
                    badgeSize: TUIBadgeSize.xs,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("SuccessCheckMark", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const TUISuccessCheckMark(),
              const SizedBox(height: 8),
              const Text("Tag-Small", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const Row(
                children: [
                  TUITag(
                      tagSize: TUITagSize.s,
                      tagText: "Label",
                      tagIconType: TUITagIconType.none),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.s,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.left),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.s,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.right),
                ],
              ),
              const Text("Tag-Medium", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const Row(
                children: [
                  TUITag(
                      tagSize: TUITagSize.m,
                      tagText: "Label",
                      tagIconType: TUITagIconType.none),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.m,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.left),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.m,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.right),
                ],
              ),
              const Text("Tag-Large", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const Row(
                children: [
                  TUITag(
                      tagSize: TUITagSize.l,
                      tagText: "Label",
                      tagIconType: TUITagIconType.none),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.l,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.left),
                  SizedBox(width: 8),
                  TUITag(
                      tagSize: TUITagSize.l,
                      tagText: "Label",
                      tagContrast: TUITagContrast.high,
                      tagIconType: TUITagIconType.right),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Text Field", style: TUITextStyle.heading6),
              const SizedBox(height: 8),
              const  TUITextField( labelText: "Label",
                prefixIcon: Icon(TUISymbol.successCheckMark),
                suffixIcon: Icon(TUISymbol.chevronDown),
                helperText: "Helper / hint message goes here.",),
              const SizedBox(height: 8),
              const  TUITextField(
                hintText: "Label",
                labelText: "Hello World",
                errorText: "Error message goes here.",),
            ],
          ),
        ));
  }
}
