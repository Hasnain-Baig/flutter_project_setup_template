import 'package:flutter/foundation.dart';

mixin SecondaryLoadingMixin on ChangeNotifier {
  bool _isSecondaryLoading = false;

  bool get isSecondaryLoading => _isSecondaryLoading;

  set isSecondaryLoading(bool value) {
    _isSecondaryLoading = value;
    notifyListeners();
  }
}
