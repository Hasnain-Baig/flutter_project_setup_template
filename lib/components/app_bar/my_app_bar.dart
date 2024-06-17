import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double elevation;
  final double bottomHeight;
  final String? title;
  final String? backIcon;
  final bool isBack;
  final bool isHome;
  final Widget? bottomWidget;
  final bool isCenter;
  final String? actionTitle;
  final Widget? actionWidget;
  final Function()? onTapAction;
  final Function()? onTapBack;

  const MyAppBar({
    super.key,
    this.title,
    this.elevation = 0,
    this.backIcon,
    this.isBack = false,
    this.isCenter = true,
    this.isHome = false,
    this.bottomWidget,
    this.height = kToolbarHeight,
    this.bottomHeight = 30.0,
    this.actionTitle,
    this.actionWidget,
    this.onTapBack,
    this.onTapAction,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: elevation,
      backgroundColor: AppColors.kPrimary,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.kPrimary,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.kWhite),
      centerTitle: isCenter,
      leading: isBack
          ? GestureDetector(
              onTap: onTapBack ?? () => Navigator.pop(context),
              child: const SizedBox(
                // width: 40,
                // height: 40,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.kWhite,
                  size: 20.0,
                ),
              ),
            )
          : null,
      title: title != null
          ? CustomTextWidget(
              text: title ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.kWhite,
              ),
            )
          : isHome
              ? const SizedBox(
                  // child: SvgPicture.asset(AppIcons.skills),
                  )
              : null,
      actions: [
        if (onTapAction != null && actionWidget == null)
          GestureDetector(
            onTap: onTapAction,
            child: Row(
              children: [
                CustomTextWidget(
                  text: actionTitle ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
        if (onTapAction != null && actionWidget != null) actionWidget!
      ],
      bottom: bottomWidget != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomHeight),
              child: bottomWidget!,
            )
          : null,
    );
  }
}
