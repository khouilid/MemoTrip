import 'package:flutter/material.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/theme/shared/font_size.dart';
import 'package:template/theme/shared/spacing.dart';

class InputStyles {
  static InputDecoration primaryInputDecoration({
    required String hintText,
    double? paddingLeft,
    double? paddingRight,
    double? paddingTop,
    double? paddingBottom,
    bool? isValid,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: FontSize.base,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade900,
      ),
      contentPadding: EdgeInsets.only(
        left: paddingLeft ?? Spacing.base,
        right: paddingRight ?? Spacing.base,
        top: paddingTop ?? Spacing.base,
        bottom: paddingBottom ?? Spacing.base,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: isValid == false ? AppColors.valentineRed : AppColors.bar,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static InputDecoration primaryTextAreaDecoration({
    required String hintText,
    double? paddingLeft,
    double? paddingRight,
    double? paddingTop,
    double? paddingBottom,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: FontSize.base,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade900,
      ),
      contentPadding: EdgeInsets.only(
        left: paddingLeft ?? Spacing.base,
        right: paddingRight ?? Spacing.base,
        top: paddingTop ?? Spacing.base,
        bottom: paddingBottom ?? Spacing.base,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      focusColor: AppColors.white,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.bar,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
