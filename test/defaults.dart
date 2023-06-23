import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';

Widget wrapApp({required Widget child}) {
  return TUIApp(
    home: child,
    theme: defaultTheme(),
  );
}

WidgetWrapper tuiAppWrapper({
  Iterable<LocalizationsDelegate<dynamic>>? localizations,
  NavigatorObserver? navigatorObserver,
  Iterable<Locale>? localeOverrides,
  TUIThemeData? theme,
}) {
  return (child) => TUIApp(
    localizationsDelegates: localizations,
    supportedLocales: localeOverrides ?? const [Locale('en')],
    theme: theme ?? defaultTheme(),
    debugShowCheckedModeBanner: false,
    home: child,
    navigatorObservers: [
      if (navigatorObserver != null) navigatorObserver,
    ],
  );
}

TUIThemeData defaultTheme() {
  return TUIThemeData(
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
      ));
}