import 'package:flutter/material.dart';
import 'package:smart_city_app/utils/themes/app_color.dart';

class FormDecoration extends InputDecoration {
  final double radius;
  final BorderSide borderSide;

  // ignore: use_super_parameters
  const FormDecoration({
    this.radius = 8,
    this.borderSide = BorderSide.none,
    prefixIcon,
    suffixIcon,
    hintText,
    contentPadding,
    filled = true,
    fillColor = AppColor.white,
    enabled = true,
  }) : super (
    prefixIcon : prefixIcon,
    hintText: hintText,
    contentPadding: contentPadding,
    filled: filled,
    fillColor: fillColor,
    suffixIcon: suffixIcon,
    enabled: enabled
  );

  @override
  Color? get prefixIconColor => AppColor.white;

  @override
  Color? get iconColor => AppColor.white;

  @override
  Color? get focusColor => AppColor.primary;

  @override
  Color? get hoverColor => AppColor.primaryAccent[100];

  @override
  TextStyle? get hintStyle => const TextStyle(
    color: AppColor.gray,
  );

  @override
  InputBorder? get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: borderSide,
      );

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: AppColor.gray,
          width: 1.0,
        ),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: AppColor.primary,
          width: 2.0,
        ),
      );
      
  InputBorder? get hoverBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: AppColor.blue,
          width: 1.5,
        ),
      );
}