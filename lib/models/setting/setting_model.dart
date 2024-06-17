class SettingsModel {
  final int? id;
  final String? name, value, type;
  final bool? showInApp, showInWeb;

  SettingsModel(
      {this.id,
      this.name,
      this.value,
      this.type,
      this.showInApp,
      this.showInWeb});

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
        id: json['id'],
        name: json['name'],
        value: json['value'],
        type: json['type'],
        showInApp: json['show_in_app'],
        showInWeb: json['show_in_web']);
  }
  static List<SettingsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SettingsModel.fromJson(json)).toList();
  }
}
