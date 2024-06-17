import 'package:flutter/foundation.dart';

mixin DisabledMixin on ChangeNotifier {
  bool _isDisabled = false;

  bool get isDisabled => _isDisabled;

  set isDisabled(bool value) {
    _isDisabled = value;
    notifyListeners();
  }
}
