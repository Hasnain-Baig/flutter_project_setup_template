import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String? header;
  final TextStyle? headerStyle;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? hintStyle, style;
  final int? maxLength;
  final bool? autoFocus;
  final double? borderRadius;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final bool? isObscure;
  final bool? hasSuffix;
  final bool? hasPrefix;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool showCounter;
  final String? error;
  final Function()? onEditingComplete, onTap;
  final ValueChanged<String>? onChanged;
  final Function(PointerDownEvent)? onTapOutside;

  const CustomTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.error,
      this.header,
      this.headerStyle,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.onTap,
      this.style,
      this.borderRadius,
      this.inputFormatters,
      this.padding,
      this.filledColor,
      this.hintStyle,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.autoFocus = false,
      this.showCounter = false,
      this.validator,
      this.onChanged,
      this.isObscure = false,
      this.readOnly = false,
      this.hasSuffix = false,
      this.hasPrefix = false,
      this.prefixIcon,
      this.suffixIcon,
      this.onEditingComplete,
      this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) ...[
          CustomTextWidget(
            text: header ?? "",
            style: headerStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kGrey80,
                ),
          ),
          const SizedBox(
            height: 4,
          )
        ],
        TextFormField(
          focusNode: focusNode,
          onTap: onTap,
          onTapOutside: onTapOutside,
          autovalidateMode: AutovalidateMode.disabled,
          textInputAction: textInputAction,
          textAlign: TextAlign.start,
          readOnly: readOnly,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          controller: textEditingController,
          initialValue: null,
          textCapitalization: keyboardType != TextInputType.emailAddress ||
                  keyboardType != TextInputType.phone ||
                  keyboardType != TextInputType.number
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          maxLines: maxLines,
          minLines: minLines,
          autofocus: autoFocus!,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: style,
          decoration: InputDecoration(
            isDense: true,
            // filled: filledColor != null ? true : readOnly,
            counterText: showCounter == true ? null : '',
            errorMaxLines: 2,
            contentPadding: padding,
            enabledBorder: readOnly
                ? OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.kGrey50, width: 2.0),
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                  )
                : error != null
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.kError, width: 2.0),
                        borderRadius: BorderRadius.circular(borderRadius ?? 12),
                      )
                    : null,
// disabledBorder: false,
            error: error != null
                ? CustomTextWidget(
                    text: error ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kError,
                    ),
                  )
                : null,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kError, width: 2.0),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),

            errorStyle: const TextStyle(
                color: AppColors.kError,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
            // suffixIcon: hasSuffix == true || suffixIcon != null
            //     ? Padding(
            //         padding: const EdgeInsets.only(right: 12.0),
            //         child: IconButton(
            //           onPressed: () {
            //             setState(() {
            //               isVisible = !isVisible;
            //             });
            //           },
            //           icon: getIcon() ?? const Icon(Icons.filter_list_alt),
            //         ),
            //       )
            //     : null,
            suffixIcon: hasSuffix == true ? suffixIcon! : null,
            prefixIcon: hasPrefix == true ? prefixIcon! : null,
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kGrey50, width: 2.0),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.kGrey50, width: 2.0),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            hintText: hintText,
            focusedBorder: readOnly == true
                ? OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.kGrey50, width: 2.0),
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                  )
                : null,
            hintStyle: hintStyle ??
                const TextStyle(
                    // color: LightColorTheme.kNeutralColor,
                    fontSize: 14),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
