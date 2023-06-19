class TUISpacing {
  TUISpacing._();

  static const double none = 0;
  static const double baseVertical = 4;
  static const double doubleVertical = baseVertical * 2;
  static const double halfVertical = baseVertical / 2;

  static const double baseHorizontal = 16;
  static const double halfHorizontal = baseHorizontal / 2;

  static double custom(double spacing) {
    return spacing;
  }

  static double verticalMultiple(double multiplier) {
    return baseVertical * multiplier;
  }

  static double horizontalMultiple(double multiplier) {
    return baseHorizontal * multiplier;
  }
}
