import 'consts.dart';
import 'package:velocity_x/velocity_x.dart';

class AppFonts {
  static String nunito = "nunito", nunitoBold = "nunitoBold";
  static const String appFont = "Inter";
}

class AppFontSizes {
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 20.0;
}

class AppSizes {}

class AppStyles {
  static normal(
      {String? title, Color? color = AppColors.textColor, double? size}) {
    return title!.text.size(14).color(color).make();
  }
  static bold(
      {String? title, Color? color = AppColors.textColor, double? size}) {
    return title!.text.size(14).color(color).fontFamily(AppFonts.nunitoBold).make();
  }
}
