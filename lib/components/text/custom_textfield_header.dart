import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../text_field/custom_text_field.dart';
import 'custom_text.dart';

class CustomTextFieldWithHeader extends StatelessWidget {
  final TextEditingController nameController;
  final String header;
  const CustomTextFieldWithHeader(
      {super.key, required this.nameController, required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: header,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
            hintStyle: const TextStyle(color: AppColors.kGrey40, fontSize: 16),
            textEditingController: nameController,
            hintText: "")
      ],
    );
  }
}
