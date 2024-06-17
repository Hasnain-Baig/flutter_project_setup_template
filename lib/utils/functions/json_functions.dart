import 'dart:convert';

class JsonFunctions {
  static bool isDataJson(String data) {
    try {
      final jsonData = json.decode(data);
      return jsonData is Map<String, dynamic> || jsonData is List<dynamic>;
    } catch (e) {
      return false;
    }
  }

  static dynamic covertToJson(String data) {
    return json.decode(data);
  }
}
