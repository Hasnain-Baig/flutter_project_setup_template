import 'package:flutter/material.dart';

class AppStyles {
  // TODO:: Add App Styles here
  static const padding = 16.0;
  static const padding20 = 20.0;
  static const padding32 = 32.0;

  static Border containerBorder(Color borderColor) {
    return Border(
      top: BorderSide(color: borderColor, width: 2),
      left: BorderSide(color: borderColor, width: 2),
      right: BorderSide(color: borderColor, width: 2),
      bottom: BorderSide(color: borderColor, width: 6),
    );
  }
}
