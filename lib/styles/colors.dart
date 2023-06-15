import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TUIColors with Diagnosticable {
  final Color primary;
  final Color onPrimary;
  final Color primaryAlt;
  final Color onPrimaryAlt;
  final Color primaryHover;
  final Color primaryAltHover;

  final Color secondary;
  final Color onSecondary;
  final Color secondaryAlt;
  final Color onSecondaryAlt;
  final Color secondaryHover;
  final Color secondaryAltHover;

  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryAlt;
  final Color onTertiaryAlt;
  final Color tertiaryHover;
  final Color tertiaryAltHover;

  final Color success;
  final Color onSuccess;
  final Color success10;
  final Color success20;

  final Color error;
  final Color onError;
  final Color error10;
  final Color errorHover;

  final Color warning;
  final Color onWarning;
  final Color warning10;
  final Color warningHover;

  final Color background;
  final Color onBackground;

  final Color outline;
  final Color disabledContent;
  final Color disabledBackground;
  final Color disabledBackgroundHover;
  final Color link;

  final Color inputText;
  final Color inputBackground;
  final Color inputTextDim;

  final Color surface;
  final Color surface50;
  final Color onSurface;
  final Color surfaceVariant;
  final Color surfaceHover;
  final Color surfaceVariantHover;

  TUIColors(
      this.primary,
      this.onPrimary,
      this.primaryAlt,
      this.onPrimaryAlt,
      this.primaryHover,
      this.primaryAltHover,
      this.secondary,
      this.onSecondary,
      this.secondaryAlt,
      this.onSecondaryAlt,
      this.secondaryHover,
      this.secondaryAltHover,
      this.tertiary,
      this.onTertiary,
      this.tertiaryAlt,
      this.onTertiaryAlt,
      this.tertiaryHover,
      this.tertiaryAltHover,
      this.success,
      this.onSuccess,
      this.success10,
      this.success20,
      this.error,
      this.onError,
      this.error10,
      this.errorHover,
      this.warning,
      this.onWarning,
      this.warning10,
      this.warningHover,
      this.background,
      this.onBackground,
      this.outline,
      this.disabledContent,
      this.disabledBackground,
      this.disabledBackgroundHover,
      this.link,
      this.inputText,
      this.inputBackground,
      this.inputTextDim,
      this.surface,
      this.surface50,
      this.onSurface,
      this.surfaceVariant,
      this.surfaceHover,
      this.surfaceVariantHover);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("primary", primary))
      ..add(ColorProperty("onPrimary", onPrimary))
      ..add(ColorProperty("primaryAlt", primaryAlt))
      ..add(ColorProperty("onPrimaryAlt", onPrimaryAlt))
      ..add(ColorProperty("primaryHover", primaryHover))
      ..add(ColorProperty("primaryAltHover", primaryAltHover))
      ..add(ColorProperty("secondary", secondary))
      ..add(ColorProperty("onSecondary", onSecondary))
      ..add(ColorProperty("secondaryAlt", secondaryAlt))
      ..add(ColorProperty("onSecondaryAlt", onSecondaryAlt))
      ..add(ColorProperty("secondaryHover", secondaryHover))
      ..add(ColorProperty("secondaryAltHover", secondaryAltHover))
      ..add(ColorProperty("tertiary", tertiary))
      ..add(ColorProperty("onTertiary", onTertiary))
      ..add(ColorProperty("tertiaryAlt", tertiaryAlt))
      ..add(ColorProperty("onTertiaryAlt", onTertiaryAlt))
      ..add(ColorProperty("tertiaryHover", tertiaryHover))
      ..add(ColorProperty("tertiaryAltHover", tertiaryAltHover))
      ..add(ColorProperty("success", success))
      ..add(ColorProperty("onSuccess", onSuccess))
      ..add(ColorProperty("success10", success10))
      ..add(ColorProperty("success20", success20))
      ..add(ColorProperty("error", error))
      ..add(ColorProperty("onError", onError))
      ..add(ColorProperty("error10", error10))
      ..add(ColorProperty("errorHover", errorHover))
      ..add(ColorProperty("warning", warning))
      ..add(ColorProperty("onWarning", onWarning))
      ..add(ColorProperty("warning10", warning10))
      ..add(ColorProperty("warningHover", warningHover))
      ..add(ColorProperty("background", background))
      ..add(ColorProperty("onBackground", onBackground))
      ..add(ColorProperty("outline", outline))
      ..add(ColorProperty("disabledContent", disabledContent))
      ..add(ColorProperty("disabledBackground", disabledBackground))
      ..add(ColorProperty("disabledBackgroundHover", disabledBackgroundHover))
      ..add(ColorProperty("link", link))
      ..add(ColorProperty("inputText", inputText))
      ..add(ColorProperty("inputBackground", inputBackground))
      ..add(ColorProperty("inputTextDim", inputTextDim))
      ..add(ColorProperty("surface", surface))
      ..add(ColorProperty("surface50", surface50))
      ..add(ColorProperty("onSurface", onSurface))
      ..add(ColorProperty("surfaceVariant", surfaceVariant))
      ..add(ColorProperty("surfaceHover", surfaceHover))
      ..add(ColorProperty("surfaceVariantHover", surfaceVariantHover));
  }
}
