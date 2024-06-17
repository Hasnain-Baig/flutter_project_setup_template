import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/logos.dart';

class CustomAppLoader extends StatelessWidget {
  final double size;
  const CustomAppLoader({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            width: size,
            height: size,
            AppLogos.logo,
            // fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: size + 20,
            height: size + 20,
            child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimary),
                strokeWidth: 2),
          )
        ],
      ),
    );
  }
}
