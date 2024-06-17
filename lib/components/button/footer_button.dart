import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/styles/styles.dart';
import '../text/custom_text.dart';
import 'custom_button.dart';

class FooterButton extends StatelessWidget {
  final Function() onTap;
  final int? index;
  final Widget? iconWidget;
  final String? buttonText;
  final bool isLoading;
  final Color btnColor;
  final Color txtColor;
  final ButtonType? buttonType;
  final double bottomPadding;
  final double topPadding;
  final bool isDisabled;
  const FooterButton(
      {super.key,
      required this.onTap,
      this.index,
      this.buttonText,
      this.isLoading = false,
      this.bottomPadding = 0.0,
      this.topPadding = 0.0,
      required this.btnColor,
      this.buttonType,
      required this.txtColor,
      this.isDisabled = false,
      this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppStyles.padding).copyWith(
        bottom: bottomPadding,
        top: topPadding,
      ),
      child: CustomButtonWidget(
          type: buttonType ?? ButtonType.elevated,
          fullWidth: true,
          borderColor: AppColors.kSecondary,
          elevation: 2,
          loading: isLoading,
          disabled: isDisabled,
          backgroundColor: btnColor,
          size: ButtonSize.lg,
          borderRadius: 16,
          onTap: onTap,
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconWidget != null) ...[
                iconWidget!,
                const SizedBox(
                  width: 8,
                )
              ],
              CustomTextWidget(
                //  type: TextType.,
                text: buttonText ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDisabled ? AppColors.kdisableTxtColor : txtColor,
                ),
              ),
            ],
          )),
    );
  }
}
