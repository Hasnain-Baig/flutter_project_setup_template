import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

TextTheme getTextTheme(
    BuildContext context, Color primaryColor, Color lightGreyColor) {
  final String fontFamily = context.locale.languageCode.isNotEmpty &&
          context.locale.languageCode != "ar"
      ? "Gotham"
      : "NotoSansArabic";

  final List<String> fontFamilyFallback = ['Gotham', 'NotoSansArabic'];

  final textTheme = Theme.of(context).textTheme;
  return textTheme.copyWith(
    headlineLarge: textTheme.displayLarge!.copyWith(
      fontSize: 28.0,
      color: primaryColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontWeight: FontWeight.w600,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      inherit: true,
    ),
    headlineMedium: textTheme.displayLarge!.copyWith(
      fontSize: 24.0,
      color: primaryColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontWeight: FontWeight.w600,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      inherit: true,
    ),
    headlineSmall: textTheme.displayLarge!.copyWith(
        fontSize: 20.0,
        color: primaryColor,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        leadingDistribution: TextLeadingDistribution.proportional,
        // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
        fontWeight: FontWeight.w500,
        // letterSpacing:
        //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
        inherit: true),
    titleLarge: textTheme.displayLarge!.copyWith(
      fontSize: 18.0,
      color: primaryColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontWeight: FontWeight.w500,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      inherit: true,
    ),
    bodyLarge: textTheme.displayLarge!.copyWith(
      fontSize: 16.0,
      color: primaryColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontWeight: FontWeight.w500,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      inherit: true,
    ),
    // TextStyle(
    // ),
    bodyMedium: textTheme.displayLarge!.copyWith(
      fontSize: 14.0,
      color: primaryColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontWeight: FontWeight.w500,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      inherit: true,
    ),

    // GoogleFonts.mulish(
    //   color: primaryColor,
    //   fontSize: 14.0,
    // ),

    // TextStyle(
    //   // fontFamily: fontFamily,
    //   // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
    //   leadingDistribution: TextLeadingDistribution.proportional,
    //   // letterSpacing:
    //   //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
    // ),
    titleMedium: TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w400,
      // leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      fontSize: 14.0,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      color: lightGreyColor,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      // leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      fontWeight: FontWeight.w400,
    ),
    // bodySmall: TextStyle(
    //     // fontFamily: fontFamily,
    //     fontSize: 14.0,
    //     color: lightGreyColor,
    //     leadingDistribution: TextLeadingDistribution.proportional,
    //     // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
    //     // letterSpacing:
    //     //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
    //     fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontSize: 14.0,
        color: lightGreyColor,
        // leadingDistribution: TextLeadingDistribution.proportional,
        // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
        // letterSpacing:
        //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
        fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      color: lightGreyColor,
      // leadingDistribution: TextLeadingDistribution.proportional,
      // height: Get.locale?.languageCode == "ar" ? 1.3 : 1.3,
      // letterSpacing:
      //     Get.locale != null && Get.locale?.languageCode != "ar" ? 0 : -0.5,
      fontWeight: FontWeight.w400,
    ),
  );
}
