import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff0052D6);
  static const Color primaryDark = Color(0xff5294FF);

  static const Color secondary = Color(0xff4D80B3);
  static const Color secondaryDark = Color(0xffA8CCF0);

  static const Color tertiary = Color(0xff924F92);
  static const Color tertiaryDark = Color(0xffE6B3E6);

  static const Color success = Color(0xff148F47);
  static const Color successDark = Color(0xff55E792);

  static const Color warning = Color(0xffFFB938);
  static const Color warningDark = Color(0xffFFB938);

  static const Color error = Color(0xffCD1D32);
  static const Color errorDark = Color(0xffD42136);

  //Base - Alt
  static const Color primaryAlt = Color(0xffD5E2F6);
  static const Color primaryAltDark = Color(0xff293B56);

  static const Color secondaryAlt = Color(0xffD2DEE9);
  static const Color secondaryAltDark = Color(0xff294056);

  static const Color tertiaryAlt = Color(0xffF3CEF3);
  static const Color tertiaryAltDark = Color(0xff532D53);

  // On Colors
  static const Color onPrimary = Color(0xffF5F9FF);
  static const Color onPrimaryDark = Color(0xffFAFCFF);

  static const Color onSecondary = Color(0xffF0F7FF);
  static const Color onSecondaryDark = Color(0xff002B57);

  static const Color onTertiary = Color(0xffFFF5FF);
  static const Color onTertiaryDark = Color(0xff5C0A5C);

  static const Color onSuccess = Color(0xffF2FDF6);
  static const Color onSuccessDark = Color(0xff003817);

  static const Color onError = Color(0xffFEFBFB);
  static const Color onErrorDark = Color(0xffFFFAFA);

  static const Color onWarning = Color(0xff241D0F);
  static const Color onWarningDark = Color(0xff003817);

  static const Color onSurface = Color(0xff1A1B1F);
  static const Color onSurfaceDark = Color(0xffFCFCFD);

  static const Color onBackground = Color(0xff171B21);
  static const Color onBackgroundDark = Color(0xffF0F2F4);

  // On Colors - Alt
  static const Color onPrimaryAlt = Color(0xff002766);
  static const Color onPrimaryAltDark = Color(0xffD6E6FF);

  static const Color onSecondaryAlt = Color(0xff003366);
  static const Color onSecondaryAltDark = Color(0xffD6EBFF);

  static const Color onTertiaryAlt = Color(0xff530953);
  static const Color onTertiaryAltDark = Color(0xffFFD6FF);

  // Input
  static const Color inputBackground = Color(0xD9EAECF0);
  static const Color inputBackgroundDark = Color(0x990F1115);

  static const Color inputText = Color(0xff1A1B1F);
  static const Color inputTextDark = Color(0xffFCFCFD);

  static const Color inputTextDim = Color(0xB31A1B1F);
  static const Color inputTextDimDark = Color(0xB2FCFCFD);

  // Utility
  static const Color disabledBackground = Color.fromARGB(31, 26, 27, 31);
  static const Color disabledBackgroundDark = Color(0x1FFCFCFD);

  static const Color disabledContent = Color(0x631A1B1F);
  static const Color disabledContentDark = Color(0x61FCFCFD);

  static const Color link = Color(0xff3381FF);
  static const Color linkDark = Color(0xff80B0FF);

  static const Color outline = Color(0xffB3BCCC);
  static const Color transparent = Color(0x00FFFFFF);

  // Backgrounds
  static const Color background = Color(0xffEAECF0);
  static const Color backgroundDark = Color(0xff0F1115);

  static Gradient backgroundScrim =
      LinearGradient(colors: [background, background.withAlpha(0)]);
  static Gradient backgroundScrimDark =
      LinearGradient(colors: [backgroundDark, backgroundDark.withAlpha(0)]);

  static const Color surface = Color(0xffF9FAFB);
  static const Color surfaceDark = Color(0xff212731);

  static const Color surfaceVariant = Color(0xffEBEFF4);
  static const Color surfaceVariantDark = Color(0xff2D3543);

  static const Color surfaceHover = Color(0x00276614);
  static const Color surfaceHoverDark = Color(0xff2D3543);

  static const Color surfaceVariantHover = Color(0xffE1E6EF);
  static const Color surfaceVariantHoverDark = Color(0xff353F50);

  static Gradient surfaceScrim =
      LinearGradient(colors: [surface, surface.withAlpha(0)]);
  static Gradient surfaceScrimDark =
      LinearGradient(colors: [surfaceDark, surfaceDark.withAlpha(0)]);

  // Constants
  static const Color constantDark = Color(0xff000000);
  static const Color constantLight = Color(0xffFFFFFF);

  static const Color primaryHover = Color(0xff005CF0);
  static const Color primaryHoverDark = Color(0xff3D87FF);

  static const Color primaryAltHover = Color(0xffC4D6F3);
  static const Color primaryAltHoverDark = Color(0xff324667);

  static const Color secondaryHover = Color(0xff5E8CBA);
  static const Color secondaryHoverDark = Color(0xff93BFEC);

  static const Color secondaryAltHover = Color(0xffC1D1E1);
  static const Color secondaryAltHoverDark = Color(0xff324D67);

  static const Color tertiaryHover = Color(0xffA257A2);
  static const Color tertiaryHoverDark = Color(0xffDF9FDF);

  static const Color tertiaryAltHover = Color(0xffEFBEEF);
  static const Color tertiaryAltHoverDark = Color(0xff633663);

  static const Color errorHover = Color(0xffDF2036);
  static const Color errorHoverDark = Color(0xffE0384C);

  static const Color warningHover = Color(0xffFFAD14);
  static const Color warningHoverDark = Color(0xffFFA90A);

  static const Color disabledBackgroundHover = Color.fromARGB(51, 26, 27, 31);
  static const Color disabledBackgroundHoverDark = Color(0x33FCFCFD);
}
