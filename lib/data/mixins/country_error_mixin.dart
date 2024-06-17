import 'package:flutter/foundation.dart';

mixin CountryErrorMixin on ChangeNotifier {
  String? _countryError;

  String? get countryError => _countryError;

  set countryError(String? value) {
    _countryError = value;
    notifyListeners();
  }
}
