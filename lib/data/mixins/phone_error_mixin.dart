import 'package:flutter/foundation.dart';

mixin PhoneErrorMixin on ChangeNotifier {
  String? _phoneError;

  String? get phoneError => _phoneError;

  set phoneError(String? value) {
    _phoneError = value;
    notifyListeners();
  }
}
