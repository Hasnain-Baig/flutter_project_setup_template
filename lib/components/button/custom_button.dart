import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

enum ButtonSize { xs, sm, md, lg }

enum ButtonType { elevated, text, outline }
// enum ButtonType { elevated, outline }

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool fullWidth;
  final bool disabled;
  final Widget text;
  final bool loading;
  final ButtonSize size;
  final ButtonType type;
  final bool isDanger;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? elevation;
  final double? loaderSize;
  final double? loaderWidth;
  final double? width;
  final double? borderRadius;

  const CustomButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
      this.borderColor,
      this.fullWidth = false,
      this.disabled = false,
      this.loading = false,
      this.loaderSize,
      this.loaderWidth,
      this.width,
      this.isDanger = false,
      this.elevation = 0.0,
      this.size = ButtonSize.lg,
      this.type = ButtonType.elevated,
      this.backgroundColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.elevated:
        return getElevatedButton();
      case ButtonType.text:
        return getTextButton();
      case ButtonType.outline:
        return getOutlineButton();
    }
  }

  getElevatedButton() {
    return FractionallySizedBox(
      widthFactor: fullWidth ? 1 : null,
      child: ElevatedButton(
        onPressed: disabled || loading ? null : onTap,
        style: _getElevatedButtonStyle(),
        child: !loading
            ? text
            : SizedBox(
                height: loaderSize ?? 20,
                width: loaderSize ?? 20,
                child: CircularProgressIndicator(
                    strokeWidth: loaderWidth ?? 4,
                    color: backgroundColor ?? AppColors.kPrimary),
              ),
      ),
    );
  }

  getOutlineButton() {
    return FractionallySizedBox(
      widthFactor: fullWidth ? 1 : null,
      child: OutlinedButton(
        onPressed: disabled || loading ? null : onTap,
        style: _getOutlineButtonStyle(),
        child: !loading
            ? text
            : SizedBox(
                width: loaderSize,
                height: loaderSize,
                child: CircularProgressIndicator(
                    strokeWidth: loaderWidth ?? 4,
                    color: backgroundColor ?? AppColors.kPrimary),
              ),
      ),
    );
  }

  getTextButton() {
    return FractionallySizedBox(
      widthFactor: fullWidth ? 1 : null,
      child: TextButton(
        onPressed: disabled || loading ? null : onTap,
        style: _getTextButtonStyle(),
        child: !loading
            ? text
            : SizedBox(
                width: loaderSize,
                height: loaderSize,
                child: CircularProgressIndicator(
                    strokeWidth: loaderWidth ?? 4,
                    color: backgroundColor ?? AppColors.kPrimary),
              ),
      ),
    );
  }

  ButtonStyle _getElevatedButtonStyle() {
    switch (size) {
      case ButtonSize.xs:
        return ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ),
          elevation: elevation,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16)),
          disabledBackgroundColor: AppColors.kdisableColor,

          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 11.0,
          //   fontWeight: FontWeight.w700,
          // ),
          maximumSize: const Size(100, 50),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      case ButtonSize.sm:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16)),
          disabledBackgroundColor: AppColors.kdisableColor,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),

          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 12.0,
          //   fontWeight: FontWeight.w700,
          // ),
          minimumSize: Size.zero,
        );
      case ButtonSize.md:
        return ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.kPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
          disabledBackgroundColor: AppColors.kdisableColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 14.0,
          ),
          maximumSize: const Size(200, 55.0),
        );
      case ButtonSize.lg:
        return ElevatedButton.styleFrom(
          // elevation: elevation,
          // shadowColor: AppColors.kTransprent,
          disabledBackgroundColor: AppColors.kdisableColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 12.0,
          ),
          backgroundColor: backgroundColor ?? AppColors.kPrimary,
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 14.0,
          //   fontWeight: FontWeight.w700,
          // ),
          side: BorderSide(
              color: borderColor ?? AppColors.kTransparent, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          ),
          minimumSize: Size(width ?? 20.0, 48.0),
        );
    }
  }

  ButtonStyle _getOutlineButtonStyle() {
    switch (size) {
      case ButtonSize.xs:
        return OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 9.0,
            vertical: 4.0,
          ),
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 10.0,
          // fontWeight: FontWeight.w700,
          // ),
          // backgroundColor: backgroundColor ?? AppColors.kWhiteColor,
          // side:
          //     BorderSide(color: borderColor ?? AppColors.kNeutral50Color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      case ButtonSize.sm:
        return OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
          // backgroundColor: backgroundColor ?? AppColors.kWhiteColor,
          // side:
          //     BorderSide(color: borderColor ?? AppColors.kNeutral50Color),
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 12.0,
          //   fontWeight: FontWeight.w500,
          // ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero,
        );
      case ButtonSize.md:
        return OutlinedButton.styleFrom(
          // minimumSize: const Size(100, 40),
          // backgroundColor: backgroundColor ?? AppColors.kWhiteColor,
          // side:
          //     BorderSide(color: borderColor ?? AppColors.kNeutral50Color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
          maximumSize: const Size(1000, 40.0),
        );
      case ButtonSize.lg:
        return OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.kWhite,
          side: BorderSide(
            width: 1,
            color: borderColor ?? AppColors.kSecondaryLight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 16.0,
            ),
          ),
          minimumSize: Size(width ?? 20.0, 55.0),
        );
    }
  }

  ButtonStyle _getTextButtonStyle() {
    switch (size) {
      case ButtonSize.xs:
        return TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 14.0,
          //   fontWeight: FontWeight.w500,
          // ),
          foregroundColor: AppColors.kPrimary,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      case ButtonSize.sm:
        return TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          foregroundColor: AppColors.kPrimary,
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 12.0,
          //   fontWeight: FontWeight.w700,
          // ),
          minimumSize: Size.zero,
        );
      case ButtonSize.md:
        return TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          foregroundColor: AppColors.kPrimary,
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 13.0,
          //   fontWeight: FontWeight.w700,
          // ),
          maximumSize: const Size(1000, 40.0),
        );
      case ButtonSize.lg:
        return TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          // textStyle: GoogleFonts.firaSans(
          //   fontSize: 14.0,
          //   fontWeight: FontWeight.w500,
          // )
        );
    }
  }
}
