import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';
import 'custom_button.dart';

class CustomButtonWidgetWithIcon extends StatelessWidget {
  final Function() onPressed;

  final String text;
  final bool isLoading;
  final bool isDisabled;
  const CustomButtonWidgetWithIcon({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onTap: onPressed,
      loading: isLoading,
      disabled: isDisabled,
      text: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.kWhite,
                fontSize: 18.0),
          ),
          const SizedBox(
            width: 4.0,
          ),
          const Icon(
            Icons.arrow_outward_rounded,
            color: AppColors.kWhite,
            size: 16,
          )
        ],
      ),
      fullWidth: true,
      backgroundColor: AppColors.kSecondary,
    );
  }
}
