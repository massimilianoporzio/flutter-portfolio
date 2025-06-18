import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  TextStyle get titleSmBold;
  TextStyle get bodyMdMedium;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
  TextStyle get titleLgBold;
}

class SmallTextStyles extends AppTextStyles {
  @override
  TextStyle get titleSmBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  @override
  TextStyle get titleLgBold =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}

class LargeTextStyles extends AppTextStyles {
  @override
  TextStyle get titleSmBold =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  @override
  TextStyle get titleMdMedium =>
      const TextStyle(fontSize: 34, fontWeight: FontWeight.w500);
  @override
  TextStyle get titleLgBold =>
      const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  TextStyle get bodyMdMedium =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyLgBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
