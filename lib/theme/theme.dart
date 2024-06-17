import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/color.dart';
import 'typography.dart';

class AppTheme {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  AppTheme(BuildContext context)
      : lightTheme = _buildLightTheme(context),
        darkTheme = _buildDarkTheme();
  static ThemeData _buildDarkTheme() {
    return ThemeData(
        // useMateriedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   elevation: 0,
        //   alignment: Alignment.center,
        // ),
        // scaffoldBackgral3: false,
        // colorScheme: const ColorScheme.dark().copyWith(
        //   primary: ColorConstant.mainRedEA2F28,
        //   secondary: ColorConstant.whiteClr,
        // ),
        // inputDecorationTheme: InputDecorationTheme(
        //   errorBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8),
        //     borderSide:
        //         BorderSide(color: ColorConstant.mainRedEA2F28, width: 1.0),
        //   ),
        //   focusedErrorBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8),
        //     borderSide:
        //         BorderSide(color: ColorConstant.mainRedEA2F28, width: 1.0),
        //   ),
        // ),
        // dialogTheme: DialogTheme(
        //   backgroundColor: ColorConstant.blackClr,
        //   shape: RoundoundColor: ColorConstant.blackClr,
        // appBarTheme: AppBarTheme(
        //   elevation: 0,
        //   backgroundColor: ColorConstant.blackClr,
        //   titleTextStyle: TextStyle(color: ColorConstant.whiteClr),
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //     statusBarIconBrightness: Brightness.light,
        //     statusBarBrightness: Brightness.dark,
        //   ),
        // ),
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        //   },
        // ),
        // fontFamily: 'PlusJakartaSans',
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: Colors.black45,
        //   showUnselectedLabels: true,
        //   showSelectedLabels: true,
        //   type: BottomNavigationBarType.fixed,
        //   unselectedLabelStyle: AppStyle.txt12white600,
        //   selectedLabelStyle: AppStyle.txt12Red700,
        //   selectedIconTheme:
        //       IconThemeData(color: ColorConstant.mainRedEA2F28, size: 12),
        //   unselectedIconTheme:
        //       IconThemeData(color: ColorConstant.whiteClr, size: 12),
        // ),
        // brightness: Brightness.dark,
        );
  }

  static ThemeData _buildLightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.kWhite,
      textTheme: getTextTheme(
          context, AppColors.kDarkTextColor, AppColors.kLightTextColor),
      // colorScheme: const ColorScheme.light().copyWith(
      //   primary: ColorConstant.mainRedEA2F28,
      //   secondary: ColorConstant.whiteClr,
      // ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.kGrey20,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kTextFieldBg),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kGrey20),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      // dialogTheme: DialogTheme(
      //   backgroundColor: ColorConstant.whiteClr,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   elevation: 0,
      //   alignment: Alignment.center,
      // ),
      // scaffoldBackgroundColor: ColorConstant.whiteColorF5F5F5,
      // pageTransitionsTheme: const PageTransitionsTheme(
      //   builders: {
      //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //   },
      // ),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: AppColors.kLightGreyBgColor.withOpacity(0.1),
        collapsedBackgroundColor: AppColors.kLightGreyBgColor.withOpacity(0.1),
        collapsedIconColor: AppColors.kPrimaryDark,
        childrenPadding:
            const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        iconColor: AppColors.kPrimaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.kWhite,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimaryDarkTextColor,
        unselectedItemColor: AppColors.kLightTextColor,
        selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.kPrimaryDarkTextColor),
        unselectedLabelStyle:
            TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        // selectedIconTheme:
        //     IconThemeData(color: ColorConstant.mainRedEA2F28, size: 12),
        // unselectedIconTheme:
        //     IconThemeData(color: ColorConstant.blackClr, size: 12),
      ),
      // brightness: Brightness.light,
      // appBarTheme: AppBarTheme(
      //   elevation: 0,
      //   backgroundColor: ColorConstant.whiteClr,
      //   titleTextStyle: TextStyle(
      //     color: ColorConstant.blackClr,
      //     fontFamily: 'PlusJakartaSans',
      //   ),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      //   statusBarIconBrightness: Brightness.dark,
      //   statusBarBrightness: Brightness.light,
      // ),
      // ),
      // fontFamily: 'PlusJakartaSans',
    );
  }
}
