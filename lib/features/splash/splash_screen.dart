import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app/app_provider.dart';
import '../../routes/routes_name.dart';
import '../../utils/constants/logos.dart';
// import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: 190,
          width: 190,
          child: Center(
            child: Image.asset(AppLogos.logo, fit: BoxFit.cover),
            // Lottie.asset(AppLogos.logoLottieAnimation, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    debugPrint('WE INSIDE SPLASH SCREEN');
    final AppProvider appProvider = Provider.of(context, listen: false);
    onStartUp(appProvider);
    super.initState();
  }

  void onStartUp(AppProvider appProvider) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamed(context, RoutesName.welcome); //comment
    // initializeDateFormatting(AppProvider.getLocaleString(), null).then((_) {});
    // await appProvider.checkStorage();
    // final SettingsService settingService = SettingsService();
    // if (!AppProvider.isOnboarded && !AppProvider.isAuthenticated) {
    //   if (mounted) {
    //     context.go(ROUTES.onBoarding.toPath);
    //   }
    // } else if (AppProvider.isOnboarded &&
    //     !AppProvider.isAuthenticated &&
    //     !AppProvider.isGuestUser) {
    //   if (mounted) {
    //     context.go(ROUTES.welcome.toPath);
    //   }
    // } else {
    //   if (mounted) {
    //     context.go(ROUTES.mainview.toPath);
    //   }
    // }
    // if (mounted) {
    //   Provider.of<SettingsProvider>(context, listen: false).settings =
    //       await settingService.getSettings();
    // }
  }
}
