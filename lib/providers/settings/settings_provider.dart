// import 'package:flutter/material.dart';
// import 'package:skills/models/app/setting_model.dart';

// import '../../models/app/setting_model.dart';

// class SettingsProvider extends ChangeNotifier {
//   List<SettingsModel> settings = [];

//   updateSettingsList(List<SettingsModel> updatedSettings) {
//     settings = updatedSettings;
//     notifyListeners();
//   }

//   String getValueByName(String name) {
//     final valueIndex = settings.indexWhere((value) => value.name == name);
//     if (valueIndex != -1) {
//       return settings[valueIndex].value.toString();
//     } else {
//       return '';
//     }
//   }
// }
