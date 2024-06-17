import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // static bool isAuthenticated = false;
  // static bool isOnboarded = false;
  // static bool isGuestUser = false;
  // final bool _isEKey = false;
  // final bool _isArabic = false;

  // // bool get isGuestUser => _isGuestUser;

  // bool get isEkey => _isEKey;

  // bool get isArabic => _isArabic;
  // static Parent? parentData;
  // // set isGuestUser(bool value) {
  // //   _isGuestUser = value;
  // // }

  // // set isArabic(bool value) {
  // //   _isArabic = value;
  // // }

  // static isLocaleArabic() {
  //   return routerContext!.locale.languageCode == "ar";
  // }

  // static String getLocaleString() {
  //   return isLocaleArabic() ? "ar_SA" : "en_US";
  // }

  // Future<void> checkStorage() async {
  //   final String? token = await UserToken.getUserToken();
  //   final bool? onboarded = await UserToken.getOnboarding();
  //   parentData = await UserToken.getParentData();
  //   final bool? guest = await UserToken.getGuestUser();
  //   // final bool? guestUser = await UserToken.getGuestUser();
  //   // final bool? isArabic = await UserToken.getIsArabic();

  //   if (onboarded != null && guest == null && token == null) {
  //     isOnboarded = true;
  //   } else if (onboarded != null && guest != null && token == null) {
  //     isOnboarded = true;
  //     isGuestUser = true;
  //   } else if (onboarded != null && guest == null && token != null) {
  //     isOnboarded = true;
  //     isAuthenticated = true;
  //     ParentProvider.parent = parentData;
  //   }

  //   // if (token != null && onboarded != null && guestUser == null) {
  //   //   _isAuthenticated = true;
  //   //   isOnboarded = true;
  //   // } else if (token == null && onboarded != null && guestUser != null) {
  //   //   isOnboarded = true;
  //   //   // _isGuestUser = true;
  //   // } else if (token == null && onboarded != null && guestUser == null) {
  //   //   _isOnboarded = true;
  //   // }
  // }

  // Future<void> logout() async {
  //   await UserToken.logout();
  //   isAuthenticated = false;
  //   isGuestUser = false;
  // }
}
