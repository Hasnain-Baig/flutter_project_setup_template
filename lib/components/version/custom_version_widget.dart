import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';

class CustomVersionWidget extends StatelessWidget {
  const CustomVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (dotenv.get('ENVIRONMENT') == "LOCAL") {
      return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Center(
              child: CustomTextWidget(
                  style: TextStyle(color: AppColors.kGrey30),
                  text: "Testing Version")));
    }
    return const SizedBox.shrink();
  }
}
