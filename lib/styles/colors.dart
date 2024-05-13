import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// TUIColors is a class that holds all the colors used in the Tarka UI.
class TUIColors with Diagnosticable {
  final Color primary;
  final Color onPrimary;
  final Color primaryAlt;
  final Color onPrimaryAlt;
  final Color primaryHover;
  final Color primaryAltHover;
  final Color primary10;
  final Color primary20;
  final Color primary30;

  final Color secondary;
  final Color onSecondary;
  final Color secondaryAlt;
  final Color onSecondaryAlt;
  final Color secondaryHover;
  final Color secondaryAltHover;
  final Color secondary10;
  final Color secondary20;
  final Color secondary30;

  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryAlt;
  final Color onTertiaryAlt;
  final Color tertiaryHover;
  final Color tertiaryAltHover;
  final Color tertiary10;
  final Color tertiary20;
  final Color tertiary30;

  final Color success;
  final Color onSuccess;
  final Color success10;
  final Color success20;
  final Color success30;

  final Color error;
  final Color onError;
  final Color errorHover;
  final Color error10;
  final Color error20;
  final Color error30;

  final Color warning;
  final Color onWarning;
  final Color warningHover;
  final Color warning10;
  final Color warning20;
  final Color warning30;

  final Color background;
  final Color onBackground;
  final Gradient backgroundScrim;

  final Color inputText;
  final Color inputBackground;
  final Color inputTextDim;

  final Color surface;
  final Color onSurface;
  final Color surfaceHover;
  final Color surfaceVariant;
  final Color surfaceVariantHover;
  final Color surface60;
  final Gradient surfaceScrim;

  final Color outline;
  final Color disabledContent;
  final Color disabledBackground;
  final Color disabledBackgroundHover;
  final Color link;

  final Color constantLight;
  final Color constantDark;

  TUIColors({required this.primary,
    required this.onPrimary,
    required this.primaryHover,
    required this.primaryAlt,
    required this.onPrimaryAlt,
    required this.primaryAltHover,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryHover,
    required this.secondaryAlt,
    required this.onSecondaryAlt,
    required this.secondaryAltHover,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryHover,
    required this.tertiaryAlt,
    required this.onTertiaryAlt,
    required this.tertiaryAltHover,
    required this.success,
    required this.onSuccess,
    required this.error,
    required this.onError,
    required this.errorHover,
    required this.warning,
    required this.onWarning,
    required this.warningHover,
    required this.background,
    required this.onBackground,
    required this.backgroundScrim,
    required this.surface,
    required this.onSurface,
    required this.surfaceHover,
    required this.surfaceVariant,
    required this.surfaceVariantHover,
    required this.surfaceScrim,
    required this.outline,
    required this.disabledContent,
    required this.disabledBackground,
    required this.disabledBackgroundHover,
    required this.link,
    required this.inputText,
    required this.inputBackground,
    required this.inputTextDim,
    required this.constantLight,
    required this.constantDark})
      : primary10 = primary.withAlpha(25),
        primary20 = primary.withAlpha(51),
        primary30 = primary.withAlpha(76),
        secondary10 = secondary.withAlpha(25),
        secondary20 = secondary.withAlpha(51),
        secondary30 = secondary.withAlpha(76),
        tertiary10 = tertiary.withAlpha(25),
        tertiary20 = tertiary.withAlpha(51),
        tertiary30 = tertiary.withAlpha(76),
        success10 = success.withAlpha(25),
        success20 = success.withAlpha(51),
        success30 = success.withAlpha(76),
        warning10 = warning.withAlpha(25),
        warning20 = warning.withAlpha(51),
        warning30 = warning.withAlpha(76),
        error10 = error.withAlpha(25),
        error20 = error.withAlpha(51),
        error30 = error.withAlpha(76),
        surface60 = surface.withAlpha(153);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("primary", primary))
      ..add(ColorProperty("onPrimary", onPrimary))..add(
        ColorProperty("primaryHover", primaryHover))
      ..add(ColorProperty("primaryAlt", primaryAlt))
      ..add(ColorProperty("onPrimaryAlt", onPrimaryAlt))
      ..add(ColorProperty("primaryAltHover", primaryAltHover))
      ..add(ColorProperty("secondary", secondary))
      ..add(ColorProperty("onSecondary", onSecondary))..add(
        ColorProperty("secondaryHover", secondaryHover))
      ..add(ColorProperty("secondaryAlt", secondaryAlt))
      ..add(ColorProperty("onSecondaryAlt", onSecondaryAlt))
      ..add(ColorProperty("secondaryAltHover", secondaryAltHover))
      ..add(ColorProperty("tertiary", tertiary))
      ..add(ColorProperty("onTertiary", onTertiary))..add(
        ColorProperty("tertiaryHover", tertiaryHover))
      ..add(ColorProperty("tertiaryAlt", tertiaryAlt))
      ..add(ColorProperty("onTertiaryAlt", onTertiaryAlt))
      ..add(ColorProperty("tertiaryAltHover", tertiaryAltHover))
      ..add(ColorProperty("success", success))
      ..add(ColorProperty("onSuccess", onSuccess))
      ..add(ColorProperty("error", error))
      ..add(ColorProperty("onError", onError))
      ..add(ColorProperty("errorHover", errorHover))
      ..add(ColorProperty("warning", warning))
      ..add(ColorProperty("onWarning", onWarning))
      ..add(ColorProperty("warningHover", warningHover))
      ..add(ColorProperty("background", background))
      ..add(ColorProperty("onBackground", onBackground))..add(
        DiagnosticsProperty<Gradient>("backgroundScrim", backgroundScrim))..add(
        ColorProperty("surface", surface))..add(
        ColorProperty("onSurface", onSurface))..add(
        ColorProperty("surfaceHover", surfaceHover))..add(
        ColorProperty("surfaceVariant", surfaceVariant))..add(
        ColorProperty("surfaceVariantHover", surfaceVariantHover))..add(
        DiagnosticsProperty<Gradient>("surfaceScrim", surfaceScrim))
      ..add(ColorProperty("outline", outline))
      ..add(ColorProperty("disabledContent", disabledContent))
      ..add(ColorProperty("disabledBackground", disabledBackground))
      ..add(ColorProperty("disabledBackgroundHover", disabledBackgroundHover))
      ..add(ColorProperty("link", link))
      ..add(ColorProperty("inputText", inputText))
      ..add(ColorProperty("inputBackground", inputBackground))
      ..add(ColorProperty("inputTextDim", inputTextDim))..add(
        ColorProperty("constantLight", constantLight))..add(
        ColorProperty("constantDark", constantDark));
  }
}
