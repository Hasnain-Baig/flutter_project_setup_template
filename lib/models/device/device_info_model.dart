class DeviceInfoModel {
  final String deviceId;
  final String deviceOs;
  final String deviceToken;
  final String deviceOsVersion;
  final String? deviceName;
  final String? deviceHeight;
  final String? deviceWidth;
  final String? userAgent;
  String? buildCurrentVersionNumber;

  DeviceInfoModel(
      this.deviceId, this.deviceOs, this.deviceToken, this.deviceOsVersion,
      {this.deviceName,
      this.deviceHeight,
      this.deviceWidth,
      this.userAgent,
      this.buildCurrentVersionNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'device_id': deviceId,
      'device_os': deviceOs,
      'device_os_version': deviceOsVersion,
      'device_token': deviceToken,
      'device_name': deviceName,
      'device_height': deviceHeight,
      'device_width': deviceWidth,
      'user_agent': userAgent,
      'app_version': buildCurrentVersionNumber
    };

    json.removeWhere((key, value) => value == null || value == '');

    return json;
  }
}
