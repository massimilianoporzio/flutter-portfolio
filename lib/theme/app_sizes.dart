class Insets {
  static const double maxWidth = 1280.0;
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
