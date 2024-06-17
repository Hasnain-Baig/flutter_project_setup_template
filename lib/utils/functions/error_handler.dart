import 'dart:developer';

import '../../components/toast/custom_toast.dart';
import 'json_functions.dart';

class ErrorHandler {
  static String? getErrorMsgFromException(
    dynamic e, {
    bool isShowToast = true,
    bool isErrorData = false,
  }) {
    try {
      if (JsonFunctions.isDataJson(e.toString().replaceAll("Exception:", ""))) {
        Map error = JsonFunctions.covertToJson(
            e.toString().replaceAll("Exception:", ""));
        String? errorMessage =
            error.containsKey("message") ? error["message"] : null;
        String? errorData = error.containsKey("data") ? error["data"] : null;
        log("show toast=>$isShowToast==$errorMessage");
        if (isShowToast && isErrorData && errorData != null) {
          customToast(msg: errorData.replaceAll("-", " "), isFailed: true);
        } else if (isShowToast && errorMessage != null) {
          // log("show toast");
          customToast(msg: errorMessage.replaceAll("-", " "), isFailed: true);
        }
        return errorMessage;
      }
      return null;
    } catch (e) {
      log("error in handler==>${e.toString()}");
      return null;
    }
  }
}
