import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class CustomButtonLoader extends StatelessWidget {
  final double? loaderSize;
  final double? loaderWidth;
  final Color? color;

  const CustomButtonLoader(
      {super.key, this.color, this.loaderSize, this.loaderWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: loaderSize ?? 20,
      width: loaderSize ?? 20,
      child: CircularProgressIndicator(
          strokeWidth: loaderWidth ?? 4, color: color ?? AppColors.kPrimary),
    );
  }
}
