import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// TUITypography is a class that holds all the text styles used in the Tarka UI.
class TUITypography with Diagnosticable {
  final TextStyle xl5;
  final TextStyle xl4;
  final TextStyle xl3;
  final TextStyle xl2;
  final TextStyle xl;
  final TextStyle lg;
  final TextStyle base;
  final TextStyle sm;
  final TextStyle xs;
  final TextStyle xs2;

  final TextStyle xl5SemiBold;
  final TextStyle xl4SemiBold;
  final TextStyle xl3SemiBold;
  final TextStyle xl2SemiBold;
  final TextStyle xlSemiBold;
  final TextStyle lgSemiBold;
  final TextStyle baseSemiBold;
  final TextStyle smSemiBold;
  final TextStyle xsSemiBold;
  final TextStyle xs2SemiBold;

  final TextStyle xl5Bold;
  final TextStyle xl4Bold;
  final TextStyle xl3Bold;
  final TextStyle xl2Bold;
  final TextStyle xlBold;
  final TextStyle lgBold;
  final TextStyle baseBold;
  final TextStyle smBold;
  final TextStyle xsBold;
  final TextStyle xs2Bold;

  TUITypography({
    required this.xl5,
    required this.xl4,
    required this.xl3,
    required this.xl2,
    required this.xl,
    required this.lg,
    required this.base,
    required this.sm,
    required this.xs,
    required this.xs2,
    TextStyle? xl5SemiBold,
    TextStyle? xl4SemiBold,
    TextStyle? xl3SemiBold,
    TextStyle? xl2SemiBold,
    TextStyle? xlSemiBold,
    TextStyle? lgSemiBold,
    TextStyle? baseSemiBold,
    TextStyle? smSemiBold,
    TextStyle? xsSemiBold,
    TextStyle? xs2SemiBold,
    TextStyle? xl5Bold,
    TextStyle? xl4Bold,
    TextStyle? xl3Bold,
    TextStyle? xl2Bold,
    TextStyle? xlBold,
    TextStyle? lgBold,
    TextStyle? baseBold,
    TextStyle? smBold,
    TextStyle? xsBold,
    TextStyle? xs2Bold,
  })  : xl5SemiBold = xl5SemiBold ?? xl5.copyWith(fontWeight: FontWeight.w600),
        xl4SemiBold = xl4SemiBold ?? xl4.copyWith(fontWeight: FontWeight.w600),
        xl3SemiBold = xl3SemiBold ?? xl3.copyWith(fontWeight: FontWeight.w600),
        xl2SemiBold = xl2SemiBold ?? xl2.copyWith(fontWeight: FontWeight.w600),
        xlSemiBold = xlSemiBold ?? xl.copyWith(fontWeight: FontWeight.w600),
        lgSemiBold = lgSemiBold ?? lg.copyWith(fontWeight: FontWeight.w600),
        baseSemiBold =
            baseSemiBold ?? base.copyWith(fontWeight: FontWeight.w600),
        smSemiBold = smSemiBold ?? sm.copyWith(fontWeight: FontWeight.w600),
        xsSemiBold = xsSemiBold ?? xs.copyWith(fontWeight: FontWeight.w600),
        xs2SemiBold = xs2SemiBold ?? xs2.copyWith(fontWeight: FontWeight.w600),
        xl5Bold = xl5Bold ?? xl5.copyWith(fontWeight: FontWeight.w700),
        xl4Bold = xl4Bold ?? xl4.copyWith(fontWeight: FontWeight.w700),
        xl3Bold = xl3Bold ?? xl3.copyWith(fontWeight: FontWeight.w700),
        xl2Bold = xl2Bold ?? xl2.copyWith(fontWeight: FontWeight.w700),
        xlBold = xlBold ?? xl.copyWith(fontWeight: FontWeight.w700),
        lgBold = lgBold ?? lg.copyWith(fontWeight: FontWeight.w600),
        baseBold = baseBold ?? base.copyWith(fontWeight: FontWeight.w600),
        smBold = smBold ?? sm.copyWith(fontWeight: FontWeight.w600),
        xsBold = xsBold ?? xs.copyWith(fontWeight: FontWeight.w600),
        xs2Bold = xs2Bold ?? xs2.copyWith(fontWeight: FontWeight.w600);

  TUITypography.withFontWeights({
    required TextStyle xl5,
    required TextStyle xl4,
    required TextStyle xl3,
    required TextStyle xl2,
    required TextStyle xl,
    required TextStyle lg,
    required TextStyle base,
    required TextStyle sm,
    required TextStyle xs,
    required TextStyle xs2,
    required FontWeight xl5SemiBoldWeight,
    required FontWeight xl4SemiBoldWeight,
    required FontWeight xl3SemiBoldWeight,
    required FontWeight xl2SemiBoldWeight,
    required FontWeight xlSemiBoldWeight,
    required FontWeight lgSemiBoldWeight,
    required FontWeight baseSemiBoldWeight,
    required FontWeight smSemiBoldWeight,
    required FontWeight xsSemiBoldWeight,
    required FontWeight xs2SemiBoldWeight,
    required FontWeight xl5BoldWeight,
    required FontWeight xl4BoldWeight,
    required FontWeight xl3BoldWeight,
    required FontWeight xl2BoldWeight,
    required FontWeight xlBoldWeight,
    required FontWeight lgBoldWeight,
    required FontWeight baseBoldWeight,
    required FontWeight smBoldWeight,
    required FontWeight xsBoldWeight,
    required FontWeight xs2BoldWeight,
  }) : this(
          xl5: xl5,
          xl4: xl4,
          xl3: xl3,
          xl2: xl2,
          xl: xl,
          lg: lg,
          base: base,
          sm: sm,
          xs: xs,
          xs2: xs2,
          xl5SemiBold: xl5.copyWith(fontWeight: xl5SemiBoldWeight),
          xl4SemiBold: xl4.copyWith(fontWeight: xl4SemiBoldWeight),
          xl3SemiBold: xl3.copyWith(fontWeight: xl3SemiBoldWeight),
          xl2SemiBold: xl2.copyWith(fontWeight: xl2SemiBoldWeight),
          xlSemiBold: xl.copyWith(fontWeight: xlSemiBoldWeight),
          lgSemiBold: lg.copyWith(fontWeight: lgSemiBoldWeight),
          baseSemiBold: base.copyWith(fontWeight: baseSemiBoldWeight),
          smSemiBold: sm.copyWith(fontWeight: smSemiBoldWeight),
          xsSemiBold: xs.copyWith(fontWeight: xsSemiBoldWeight),
          xs2SemiBold: xs2.copyWith(fontWeight: xs2SemiBoldWeight),
          xl5Bold: xl5.copyWith(fontWeight: xl5BoldWeight),
          xl4Bold: xl4.copyWith(fontWeight: xl4BoldWeight),
          xl3Bold: xl3.copyWith(fontWeight: xl3BoldWeight),
          xl2Bold: xl2.copyWith(fontWeight: xl2BoldWeight),
          xlBold: xl.copyWith(fontWeight: xlBoldWeight),
          lgBold: lg.copyWith(fontWeight: lgBoldWeight),
          baseBold: base.copyWith(fontWeight: baseBoldWeight),
          smBold: sm.copyWith(fontWeight: smBoldWeight),
          xsBold: xs.copyWith(fontWeight: xsBoldWeight),
          xs2Bold: xs2.copyWith(fontWeight: xs2BoldWeight),
        );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>('xl5', xl5))
      ..add(DiagnosticsProperty<TextStyle>('xl4', xl4))
      ..add(DiagnosticsProperty<TextStyle>('xl3', xl3))
      ..add(DiagnosticsProperty<TextStyle>('xl2', xl2))
      ..add(DiagnosticsProperty<TextStyle>('xl', xl))
      ..add(DiagnosticsProperty<TextStyle>('lg', lg))
      ..add(DiagnosticsProperty<TextStyle>('base', base))
      ..add(DiagnosticsProperty<TextStyle>('sm', sm))
      ..add(DiagnosticsProperty<TextStyle>('xs', xs))
      ..add(DiagnosticsProperty<TextStyle>('xs2', xs2))
      ..add(DiagnosticsProperty<TextStyle>('xl5SemiBold', xl5SemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xl4SemiBold', xl4SemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xl3SemiBold', xl3SemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xl2SemiBold', xl2SemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xlSemiBold', xlSemiBold))
      ..add(DiagnosticsProperty<TextStyle>('lgSemiBold', lgSemiBold))
      ..add(DiagnosticsProperty<TextStyle>('baseSemiBold', baseSemiBold))
      ..add(DiagnosticsProperty<TextStyle>('smSemiBold', smSemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xsSemiBold', xsSemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xs2SemiBold', xs2SemiBold))
      ..add(DiagnosticsProperty<TextStyle>('xl5Bold', xl5Bold))
      ..add(DiagnosticsProperty<TextStyle>('xl4Bold', xl4Bold))
      ..add(DiagnosticsProperty<TextStyle>('xl3Bold', xl3Bold))
      ..add(DiagnosticsProperty<TextStyle>('xl2Bold', xl2Bold))
      ..add(DiagnosticsProperty<TextStyle>('xlBold', xlBold))
      ..add(DiagnosticsProperty<TextStyle>('lgBold', lgBold))
      ..add(DiagnosticsProperty<TextStyle>('baseBold', baseBold))
      ..add(DiagnosticsProperty<TextStyle>('smBold', smBold))
      ..add(DiagnosticsProperty<TextStyle>('xsBold', xsBold))
      ..add(DiagnosticsProperty<TextStyle>('xs2Bold', xs2Bold));
  }
}
