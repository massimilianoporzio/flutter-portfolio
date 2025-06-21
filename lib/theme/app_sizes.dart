class Insets {
  static const double maxWidth = 1280.0;
  static double get xs => 4.0;
  static double get sm => 8.0;
  static double get md => 12.0;
  static double get lg => 16.0;
  static double get xl => 24.0;
  static double get xxl => 40.0;
  static double get xxxl => 80.0;
}

abstract class AppSizes {
  double get padding;
  double get appBarHeight;
}

class LargeInsets extends AppSizes {
  @override
  double get padding => 80.0;

  @override
  // TODO: implement appBarHeight
  double get appBarHeight => 64.0;
}

class SmallInsets extends AppSizes {
  @override
  double get padding => 16.0;

  @override
  // TODO: implement appBarHeight
  double get appBarHeight => 56.0;
}
