import 'package:flutter/material.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/theme/shared/font_family.dart';
import 'package:template/theme/shared/font_size.dart';


class BtnStyle {
  static ButtonStyle primaryBtn({
    double? paddingX,
    double? paddingY,
    double? borderRadius,
    double? fontSize,
  }) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          vertical: paddingY ?? 16,
          horizontal: paddingX ?? 16,
        ),
      ),
      overlayColor: WidgetStateProperty.all(
        AppColors.white.withOpacity(0.1),
      ),
      backgroundColor: WidgetStateProperty.all(AppColors.bar),
      foregroundColor: WidgetStateProperty.all(
        Colors.white,
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: fontSize ?? FontSize.base,
          fontFamily: FontFamily.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
    );
  }

  static ButtonStyle secondaryBtn({
    double? paddingX,
    double? paddingY,
    double? borderRadius,
    double? fontSize,
  }) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          vertical: paddingY ?? 16,
          horizontal: paddingX ?? 16,
        ),
      ),
      overlayColor: WidgetStateProperty.all(
        AppColors.grey.withOpacity(0.1),
      ),
      backgroundColor:
          WidgetStateProperty.all(Colors.grey.shade200.withOpacity(1)),
      foregroundColor: WidgetStateProperty.all(
        AppColors.black,
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: fontSize ?? FontSize.base,
          fontFamily: FontFamily.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
    );
  }

  static ButtonStyle ghostBtn({
    double? paddingX,
    double? paddingY,
    double? borderRadius,
    double? fontSize,
  }) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          vertical: paddingY ?? 16,
          horizontal: paddingX ?? 16,
        ),
      ),
      overlayColor: WidgetStateProperty.all(
        AppColors.black.withOpacity(0.1),
      ),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.all(
        AppColors.black,
      ),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontSize: fontSize ?? FontSize.base,
          fontFamily: FontFamily.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
    );
  }
}
