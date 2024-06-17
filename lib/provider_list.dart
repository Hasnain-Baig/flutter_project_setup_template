import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'providers/app/app_provider.dart';

class Providers {
  static List<SingleChildWidget> allProviders = [
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
    ),
  ];
}
