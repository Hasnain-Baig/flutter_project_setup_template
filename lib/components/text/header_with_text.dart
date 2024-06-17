import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../button/custom_button.dart';
import 'custom_text.dart';

class HeaderWithTextBtn extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isViewAllVisible;
  const HeaderWithTextBtn(
      {super.key,
      required this.text,
      this.onPressed,
      this.isViewAllVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: text,
            type: TextType.h3,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          if (onPressed != null && isViewAllVisible)
            CustomButtonWidget(
              onTap: onPressed,
              type: ButtonType.text,
              text: CustomTextWidget(
                text: "see_all".tr(),
                type: TextType.subtitle2,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColors.kPrimary,
                    fontWeight: FontWeight.w700),
              ),
            )

          // CustomButtonWidget(
          //   onTap: () {},
          //   type: ButtonType.text,
          //   text: const CustomTextWidget(
          //     text: 'See all',
          //     type: TextType.subtitle2,
          //     style: TextStyle(
          //         color: AppColors.kPrimary, fontWeight: FontWeight.w700),
          //   ),
          // )
        ],
      ),
    );
  }
}
