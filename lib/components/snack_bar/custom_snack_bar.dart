import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';

void showSnackBar(BuildContext context, {String? text}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: AppColors.kGreenBgLight, width: 1),
    ),
    dismissDirection: DismissDirection.up,
    // behavior: SnackBarBehavior.floating,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.check,
          color: AppColors.kGreen70,
        ),
        CustomTextWidget(
          text: text ?? "code_send".tr(),
          style: const TextStyle(fontSize: 12, color: AppColors.kGreen70),
          textAlign: TextAlign.start,
        ),
      ],
    ),
    backgroundColor: AppColors.kLighterGreenBorderColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
