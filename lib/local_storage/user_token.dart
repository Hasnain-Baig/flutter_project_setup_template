// import 'dart:convert';
// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/parent/parent_model.dart';

// class UserToken {
//   UserToken._();

//   static const String _userTokenKey = 'userToken';
//   // static const String _userData = 'userData';
//   static const String _parentData = 'parentData';
//   static const String _onboardingKey = 'onboarding';
//   static const String _guestUserKey = 'isGuest';
//   static const String _isArabic = 'isArabic';

//   static Future<void> setUserToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();

//     await prefs.setString(_userTokenKey, token);
//     log("set token $token");
//   }

//   static Future<String?> getUserToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     log("get token ${prefs.getString(_userTokenKey)}");

//     return prefs.getString(_userTokenKey);
//   }

//   static Future<void> setOnboarding(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_onboardingKey, value);
//   }

//   static Future<bool?> getOnboarding() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_onboardingKey);
//   }

//   static Future<bool?> setGuestUser(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.setBool(_guestUserKey, value);
//   }

//   static Future<bool?> getGuestUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_guestUserKey);
//   }

//   static Future<void> setIsArabic(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_isArabic, value);
//   }

//   static Future<bool?> getIsArabic() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_isArabic);
//   }

//   static Future<void> setParentData(Parent? parent) async {
//     log("setting ParentData");
//     final prefs = await SharedPreferences.getInstance();
//     final parentDataJson = parent?.toJson();
//     log("ParentData set successfully with modeling $parentDataJson");

//     await prefs.setString(_parentData, jsonEncode(parentDataJson));
//     log("ParentData set successfully");
//   }

//   static Future<Parent?> getParentData() async {
//     log("getting ParentData");

//     final prefs = await SharedPreferences.getInstance();
//     final parentDataJson = prefs.getString(_parentData);

//     if (parentDataJson != null) {
//       final parentDataMap = jsonDecode(parentDataJson);
//       log("ParentData get successfully with modeling $parentDataMap");
//       return Parent.fromJson(parentDataMap);
//     }
//     return null;
//   }

//   static Future<bool?> removeParent() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.remove(_parentData);
//   }

//   static Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_parentData);
//     await prefs.remove(_guestUserKey);
//     await prefs.remove(_userTokenKey);
//     await removeParent();
//   }
// }
