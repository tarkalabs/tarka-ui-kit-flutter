import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:tarka_ui/components/button/slf_button.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';

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
    return m.Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        children: [
          SlfButton(
            type: TUIButtonType.primary,
            size: TUIButtonSize.l,
            onPressed: () => {},
            label: "Hello World",
          ),

        ],
      ),
    ));
  }
}
