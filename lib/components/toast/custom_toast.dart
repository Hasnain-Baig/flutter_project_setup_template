import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/constants/color.dart';

void customToast(
    {required String msg, bool isSuccess = false, bool isFailed = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccess
          ? AppColors.kSuccess
          : isFailed
              ? AppColors.kDangerTextColor
              : AppColors.kGrey40,
      textColor:
          isSuccess || isFailed ? AppColors.kWhite : AppColors.kDarkTextColor,
      fontSize: 16.0);
}
