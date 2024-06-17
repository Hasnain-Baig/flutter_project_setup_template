// import 'dart:developer';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../../providers/app/app_provider.dart';

// String? phoneNumberValidator(String? phone, int length) {
//   debugPrint(phone);
//   // if (phone != null && phone.isEmpty) {
//   //   return null;
//   // }
//   // String cleanNumber = phone!.replaceAll(RegExp(r'[^0-9]'), '');

//   // if (cleanNumber.isEmpty) {
//   //   return 'phone_error'.tr();
//   // } else if (cleanNumber.length < length) {
//   //   return 'phone_error'.tr();
//   // }
//   if (phone != null && phone.isEmpty) {
//     return AppProvider.isLocaleArabic()
//         ? "${"is_required".tr()} ${"phone_number".tr()}"
//         : "${"phone_number".tr()} ${"is_required".tr()}";
//   } else if (phone != null && phone.length < length) {
//     return 'phone_error'.tr();
//   }
//   return null;
// }

// String? validateAge(String? value, String? name) {
//   log("value===>$value");
//   if (value?.isEmpty == true) {
//     return AppProvider.isLocaleArabic()
//         ? "${"is_required".tr()} $name"
//         : "$name ${"is_required".tr()}";
//   } else if (int.parse(value ?? "0") < 3 || int.parse(value ?? "0") > 13) {
//     return AppProvider.isLocaleArabic()
//         ? "${"age_constaint_3_13".tr()} $name"
//         : "$name ${"age_constaint_3_13".tr()}";
//   }
//   return null;
// }

// String? validateEmail(String? value) {
//   final email = value!.trim();

//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regExp = RegExp(pattern);

//   if (email.isEmpty) {
//     return AppProvider.isLocaleArabic()
//         ? "${"is_required".tr()} ${"email".tr()}"
//         : "${"email".tr()} ${"is_required".tr()}";
//   } else if (!regExp.hasMatch(email)) {
//     return "invalid_email".tr();
//   }
//   return null;
// }

// String? validateForm(String? value, String? name) {
//   log("value===>$value");
//   if (value?.isEmpty == true) {
//     return "$name is required.";
//   }
//   return null;
// }

// String? validatePassword(String? value) {
//   if (value!.isEmpty) {
//     return AppProvider.isLocaleArabic()
//         ? "${"is_required".tr()} ${"password".tr()}"
//         : "${"password".tr()} ${"is_required".tr()}";
//   } else if (value.length < 8) {
//     return "password_constraint_8_characters".tr();
//   }
//   return null;
// }

// // String? validateConfirmPassword(String? value, String? password) {
// //   if (value!.isEmpty) {
// //     return AppProvider.isLocaleArabic(routerContext!)
// //         ? "${"is_required".tr()} ${"password".tr()}"
// //         : "${"password".tr()} ${"is_required".tr()}";
// //   } else if (value.length < 8) {
// //     return "password_constraint_8_characters".tr();
// //   } else if (value != password) {
// //     return "Password and Confirm Password are not same.";
// //   }
// //   return null;
// // }
