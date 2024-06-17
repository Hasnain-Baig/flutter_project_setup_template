import 'package:flutter/cupertino.dart';

import '../../utils/constants/color.dart';
import '../text/custom_text.dart';

class CupertinoAlert extends StatelessWidget {
  final String header;

  final Widget? customHeader, customContent;
  final String? content;
  final String? defaultBtnText;
  final String? destructiveBtnText;
  final Function()? destructiveBtn;
  final Function()? defaultActionFunc;
  const CupertinoAlert({
    super.key,
    this.customHeader,
    required this.header,
    this.customContent,
    this.content,
    this.defaultBtnText,
    this.destructiveBtnText,
    this.destructiveBtn,
    this.defaultActionFunc,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: customHeader ??
          CustomTextWidget(
            text: header,
            type: TextType.h4,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: customContent ?? CustomTextWidget(text: content ?? ''),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: defaultActionFunc ??
              () {
                Navigator.pop(context);
              },
          child: CustomTextWidget(
            text: defaultBtnText ?? '',
            style: const TextStyle(color: AppColors.kSecondary),
          ),
        ),
        if (destructiveBtnText != null)
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: destructiveBtn,
            child: CustomTextWidget(
              text: destructiveBtnText ?? '',
              style: const TextStyle(color: AppColors.kError),
            ),
          )
      ],
    );
  }
}
