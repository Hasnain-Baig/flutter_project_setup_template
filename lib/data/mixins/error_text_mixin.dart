import 'package:flutter/foundation.dart';

mixin ErrorTextMixin on ChangeNotifier {

  String? _errorText;
  String? get errorText => _errorText;

  set errorText(String? value) {
    _errorText = value;
    notifyListeners();
  }
}
