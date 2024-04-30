import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tarka_ui/tarka_ui.dart';

import 'colors.dart';
import 'text_style.dart';

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
  WidgetWrapper? wrapper,
  TUIThemeData? theme,
}) {
  return (child) => TUIApp(
        localizationsDelegates: localizations,
        supportedLocales: localeOverrides ?? const [Locale('en')],
        theme: theme ?? defaultTheme(),
        debugShowCheckedModeBanner: false,
        home: wrapper != null ? wrapApp(child: child) : child,
        navigatorObservers: [
          if (navigatorObserver != null) navigatorObserver,
        ],
      );
}

TUIThemeData defaultTheme() {
  return TUIThemeData(
      TUIColors(
          AppColors.primary,
          AppColors.onPrimary,
          AppColors.primaryAlt,
          AppColors.onPrimaryAlt,
          AppColors.primaryHover,
          AppColors.primaryAltHover,
          AppColors.secondary,
          AppColors.onSecondary,
          AppColors.secondaryAlt,
          AppColors.onSecondaryAlt,
          AppColors.secondaryHover,
          AppColors.secondaryAltHover,
          AppColors.tertiary,
          AppColors.onTertiary,
          AppColors.tertiaryAlt,
          AppColors.onTertiaryAlt,
          AppColors.tertiaryHover,
          AppColors.tertiaryAltHover,
          AppColors.success,
          AppColors.onSuccess,
          AppColors.success10,
          AppColors.success20,
          AppColors.error,
          AppColors.onError,
          AppColors.error10,
          AppColors.errorHover,
          AppColors.warning,
          AppColors.onWarning,
          AppColors.warning10,
          AppColors.warningHover,
          AppColors.background,
          AppColors.onBackground,
          AppColors.outline,
          AppColors.disabledContent,
          AppColors.disabledBackground,
          AppColors.disabledBackgroundHover,
          AppColors.link,
          AppColors.inputText,
          AppColors.inputBackground,
          AppColors.inputTextDim,
          AppColors.surface,
          AppColors.surface50,
          AppColors.onSurface,
          AppColors.surfaceVariant,
          AppColors.surfaceHover,
          AppColors.surfaceVariantHover,
          AppColors.constantLight,
          AppColors.constantDark),
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
