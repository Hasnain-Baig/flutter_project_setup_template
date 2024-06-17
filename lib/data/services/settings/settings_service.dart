// // ignore_for_file: unused_local_variable

// import 'dart:developer';
// import 'dart:io';

// import 'package:android_id/android_id.dart';
// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:skills/components/modal/modal_dialog.dart';
// import 'package:skills/data/network/api_service.dart';
// import 'package:skills/main.dart';
// import 'package:skills/models/app/setting_model.dart';
// import 'package:skills/models/device/device_info_model.dart';
// import 'package:skills/utils/constants/logos.dart';
// import 'package:store_redirect/store_redirect.dart';

// class SettingsService {
//   Dio dio = Api().dio;
//   static List<SettingsModel> userSettings = [];
//   static bool isOnlyPhysicalEnabled = false;
//   static bool isHuawei = false;
//   static DeviceInfoModel? deviceInfoModel;

//   Future<DeviceInfoModel?> getDeviceInfo(
//       String? fcmToken, Size screenSize) async {
//     DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     log("get device info");

//     if (Platform.isAndroid) {
//       String androidId;
//       try {
//         const androidIdPlugin = AndroidId();
//         androidId = await androidIdPlugin.getId() ?? 'Unknown ID';
//       } on PlatformException {
//         androidId = 'Failed to get Android ID.';
//       }
//       final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
//       isHuawei = isHuaweiDevice(androidInfo);

//       deviceInfoModel = DeviceInfoModel(
//         androidId,
//         Platform.operatingSystem,
//         fcmToken ?? "",
//         androidInfo.version.release,
//         deviceName: '${androidInfo.manufacturer}, ${androidInfo.model}',
//         deviceHeight: screenSize.height.toString(),
//         deviceWidth: screenSize.width.toString(),
//         userAgent: androidInfo.data.toString(),
//       );
//       log("android deviceInfoModel==>$deviceInfoModel");
//     } else if (Platform.isIOS) {
//       final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
//       deviceInfoModel = DeviceInfoModel(
//         iosDeviceInfo.identifierForVendor ?? '',
//         iosDeviceInfo.systemName,
//         fcmToken ?? "",
//         iosDeviceInfo.systemVersion,
//         deviceName: iosDeviceInfo.utsname.machine,
//         deviceHeight: screenSize.height.toString(),
//         deviceWidth: screenSize.width.toString(),
//         userAgent: iosDeviceInfo.data.toString(),
//       );
//       log("ios deviceInfoModel==>$deviceInfoModel");
//     } else {
//       // Handle other platforms if needed
//       throw UnsupportedError('Unsupported platform');
//     }
//     log("get deviceInfoModel==>$deviceInfoModel");
//     return deviceInfoModel;
//   }

//   Future<void> updateDeviceInfo(DeviceInfoModel deviceInfo) async {
//     try {
//       final Response response =
//           await dio.post('device/sync', data: deviceInfo.toJson());
//       if (response.statusCode == 200) {
//         // print(response.data);
//       }
//     } on DioException catch (e) {
//       throw Exception(e.response.toString());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Future<List<SettingsModel>> getSettings() async {
//   //   try {
//   //     final Response response = await dio.get('settings');
//   //     if (response.statusCode == 200) {
//   //       return SettingsModel.fromJsonList(response.data['data']);
//   //     }
//   //   } on DioException catch (e) {
//   //     throw Exception(e.response.toString());
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   //   return [];
//   // }

//   bool isHuaweiDevice(AndroidDeviceInfo android) {
//     String manufacturer = android.manufacturer;
//     String brand = android.brand;
//     return manufacturer.toLowerCase().contains("huawei") ||
//         brand.toLowerCase().contains("huawei");
//   }

//   Future<List<SettingsModel>> getSettings() async {
//     try {
//       // await getDeepLink();
//       final Response response = await dio.get('settings');
//       if (response.statusCode == 200) {
//         final settings = SettingsModel.fromJsonList(response.data['data']);
//         PackageInfo? packageInfo = await PackageInfo.fromPlatform();
//         userSettings = settings;
//         if (!kIsWeb) {
//           log("deviceInfoModel==>$deviceInfoModel");
//           if (deviceInfoModel != null) {
//             deviceInfoModel?.buildCurrentVersionNumber = packageInfo.version;
//             await updateDeviceInfo(deviceInfoModel!);
//           }

//           // final int customDomainIndex = userSettings
//           //     .indexWhere((element) => element.name == 'CUSTOM_DOMAIN_LIST');
//           if (Platform.isAndroid) {
//             final int updateIndex = userSettings.indexWhere(
//                 (element) => element.name == 'ANDROID_FORCE_UPDATE');
//             final int updateLinkIndex = userSettings
//                 .indexWhere((element) => element.name == 'ANDROID_STORE_LINK');
//             final int androidVersion = userSettings
//                 .indexWhere((element) => element.name == 'ANDROID_APP_VERSION');
//             if (updateIndex != -1) {
//               if (getExtendedVersionNumber(
//                       userSettings[androidVersion].value.toString()) >
//                   getExtendedVersionNumber(packageInfo.version)) {
//                 isOnlyPhysicalEnabled = false;
//                 Uri uri = Uri.parse(userSettings[updateLinkIndex].value!);
//                 String updateUrl = uri.queryParameters['id'] ?? '';
//                 openUpdateModal(updateUrl,
//                     forceUpdate:
//                         userSettings[updateIndex].value?.toLowerCase() == 'true'
//                             ? true
//                             : false);
//               } else {
//                 // isOnlyPhysicalEnabled = true;
//               }
//             }
//           } else if (Platform.isIOS) {
//             final int updateIndex = userSettings
//                 .indexWhere((element) => element.name == 'IOS_FORCE_UPDATE');
//             final int updateLinkIndex = userSettings
//                 .indexWhere((element) => element.name == 'IOS_STORE_LINK');
//             final int iosVersion = userSettings
//                 .indexWhere((element) => element.name == 'IOS_APP_VERSION');
//             debugPrint(
//                 "EXTENDED VERSION ${getExtendedVersionNumber(userSettings[iosVersion].value.toString())}");
//             debugPrint(
//                 "PACKAGEINFO VERSION ${getExtendedVersionNumber(packageInfo.version)}");
//             if (updateIndex != -1) {
//               if (getExtendedVersionNumber(
//                       userSettings[iosVersion].value.toString()) >
//                   getExtendedVersionNumber(packageInfo.version)) {
//                 isOnlyPhysicalEnabled = false;
//                 final int id =
//                     userSettings[updateLinkIndex].value!.indexOf('id');
//                 var updateId = userSettings[updateLinkIndex].value!.substring(
//                     id + 2, userSettings[updateLinkIndex].value!.length);
//                 openUpdateModal(updateId,
//                     forceUpdate:
//                         userSettings[updateIndex].value?.toLowerCase() == 'true'
//                             ? true
//                             : false);
//               } else {
//                 isOnlyPhysicalEnabled = true;
//               }
//             }
//           }

//           return settings;
//         }
//       }
//     } on DioException catch (e) {
//       throw Exception(e.response.toString());
//     }
//     return [];
//   }

//   void openUpdateModal(String updateLink, {bool forceUpdate = false}) {
//     updateApplicationModal(
//       imageSize: 100,
//       routerContext!,
//       image: AppLogos.skills,
//       header: 'update_required'.tr(),
//       subtitle: 'update_modal_desc'.tr(),
//       buttonText: 'update_app'.tr(),
//       onButtonPress: () async {
//         debugPrint('PRESSED $updateLink');
//         await StoreRedirect.redirect(
//                 androidAppId: updateLink, iOSAppId: updateLink)
//             .then((vl) => debugPrint('SHOULD BE REDIRECTED'))
//             .onError(
//               (error, st) => debugPrint('$error HAS ERROR'),
//             );
//       },
//       isBarrierDissmissable: !forceUpdate,
//     );
//   }

//   int getExtendedVersionNumber(String version) {
//     List versionCells = version.split('.');
//     versionCells = versionCells.map((i) => int.parse(i)).toList();
//     return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
//   }

//   applyAppTrackingTransparency() async {
//     if (Platform.isIOS) {
//       final TrackingStatus status =
//           await AppTrackingTransparency.trackingAuthorizationStatus;
//       if (status == TrackingStatus.notDetermined) {
//         final TrackingStatus status =
//             await AppTrackingTransparency.requestTrackingAuthorization();
//       }
//       final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
//       // log("UUID: $uuid");
//     }
//   }
// }
