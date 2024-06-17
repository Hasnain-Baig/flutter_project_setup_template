import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? filterIcon;
  final Function(String)? onChanged;
  final Function()? onTapFilter;
  final bool withBadge;
  final int filterCount;

  const CustomSearchBarWidget(
      {super.key,
      required this.controller,
      this.filterIcon,
      this.hint,
      this.onChanged,
      this.withBadge = false,
      this.filterCount = 0,
      this.onTapFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.kGrey40,
          ),
          hintText: "search".tr(),
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.kGrey40),
          suffixIcon: onTapFilter != null
              ? GestureDetector(
                  onTap: onTapFilter,
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    // child: withBadge
                    //     ? Badge(
                    //         offset: const Offset(8, -8),
                    //         alignment: Alignment.topRight,
                    //         label: Text(filterCount.toString()),
                    //         backgroundColor: AppColors.kSecondary,
                    //         // child: SvgPicture.asset(
                    //         //   filterIcon ?? IconUtils.setting3,
                    //         // ),
                    //       )
                    //     : SvgPicture.asset(
                    //         filterIcon ?? IconUtils.setting3,
                    //       ),
                  ),
                )
              : null,
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.all(14),
          //   child: SvgPicture.asset(
          //     IconUtils.search,
          //   ),
          // ),
          // hintText: hint ?? "search_text".tr,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kLighterGreyBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.kPrimary),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
