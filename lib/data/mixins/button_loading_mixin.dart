import 'package:flutter/foundation.dart';

mixin ButtonLoadingMixin on ChangeNotifier {
  bool _isButtonLoading = false;

  bool get isButtonLoading => _isButtonLoading;

  set isButtonLoading(bool value) {
    _isButtonLoading = value;
    notifyListeners();
  }
}
