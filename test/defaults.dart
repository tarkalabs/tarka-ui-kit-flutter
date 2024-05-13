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
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryAlt: AppColors.primaryAlt,
          onPrimaryAlt: AppColors.onPrimaryAlt,
          primaryHover: AppColors.primaryHover,
          primaryAltHover: AppColors.primaryAltHover,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryAlt: AppColors.secondaryAlt,
          onSecondaryAlt: AppColors.onSecondaryAlt,
          secondaryHover: AppColors.secondaryHover,
          secondaryAltHover: AppColors.secondaryAltHover,
          tertiary: AppColors.tertiary,
          onTertiary: AppColors.onTertiary,
          tertiaryAlt: AppColors.tertiaryAlt,
          onTertiaryAlt: AppColors.onTertiaryAlt,
          tertiaryHover: AppColors.tertiaryHover,
          tertiaryAltHover: AppColors.tertiaryAltHover,
          success: AppColors.success,
          onSuccess: AppColors.onSuccess,
          error: AppColors.error,
          onError: AppColors.onError,
          errorHover: AppColors.errorHover,
          warning: AppColors.warning,
          onWarning: AppColors.onWarning,
          warningHover: AppColors.warningHover,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
          outline: AppColors.outline,
          disabledContent: AppColors.disabledContent,
          disabledBackground: AppColors.disabledBackground,
          disabledBackgroundHover: AppColors.disabledBackgroundHover,
          backgroundScrim: AppColors.backgroundScrim,
          link: AppColors.link,
          inputText: AppColors.inputText,
          inputBackground: AppColors.inputBackground,
          inputTextDim: AppColors.inputTextDim,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          surfaceVariant: AppColors.surfaceVariant,
          surfaceHover: AppColors.surfaceHover,
          surfaceVariantHover: AppColors.surfaceVariantHover,
          surfaceScrim: AppColors.surfaceScrim,
          constantLight: AppColors.constantLight,
          constantDark: AppColors.constantDark),
      TUITypography(
        xl5: TUITextStyle.xl5,
        xl4: TUITextStyle.xl4,
        xl3: TUITextStyle.xl3,
        xl2: TUITextStyle.xl2,
        xl: TUITextStyle.xl,
        lg: TUITextStyle.lg,
        base: TUITextStyle.base,
        sm: TUITextStyle.sm,
        xs: TUITextStyle.xs,
        xs2: TUITextStyle.xs2,
      ));
}
