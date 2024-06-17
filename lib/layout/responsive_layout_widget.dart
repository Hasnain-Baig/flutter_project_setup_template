import 'package:flutter/material.dart';

class ResponsiveLayoutWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayoutWidget({
    super.key,
    this.desktop,
    required this.mobile,
    this.tablet,
  });

  /// mobile < 650
  static bool isMobileOnly(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// mobile < 650 OR TABLET POTRAIT
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650 ||
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// tablet >= 650
  static bool isTablet(BuildContext context) {
    // log(
    //     "potrait is tablet func===>${MediaQuery.of(context).orientation}");
    return MediaQuery.of(context).size.width >= 650;
  }

  static bool isTabletAndLandscapeMode(BuildContext context) =>
      // log(
      //     "potrait is tablet func===>${MediaQuery.of(context).orientation}");
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  /// tablet >= 650
  static bool isTabletAndPotraitMode(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).orientation == Orientation.portrait;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isWidthGreaterThan(BuildContext context,
          {required double customWidth}) =>
      MediaQuery.of(context).size.width >= customWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop ?? tablet ?? mobile;
      } else if (constraints.maxWidth >= 650 &&
          MediaQuery.of(context).orientation == Orientation.landscape) {
        return tablet ?? mobile;
      } else {
        return mobile;
      }
    });
  }
}
