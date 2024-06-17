import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

import 'provider_list.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';
import 'utils/constants/strings.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   log("_handleBackgroundMessage main.dart notification ==>${message}");
//   log("_handleBackgroundMessage  main.dart notification data==>${message.data}");
//   _notificationService.handleNotification(message);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: '.env');
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // tz.initializeTimeZones();

  // await _notificationService.init();
  // await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // Future<void> handleBackgroundMessage(RemoteMessage message) async {
  //   log("_handleBackgroundMessage notification ==>${message}");
  //   log("_handleBackgroundMessage notification data==>${message.data}");
  // }

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    // EasyLocalization(
    // supportedLocales: const [
    //   Language.english,
    //   Language.arabic,
    // ],
    // path: 'lib/translations',
    // fallbackLocale: Language.english,
    // child:
    const MyApp(),
    // ),
  );
}

BuildContext globalContext = navigatorKey.currentContext!;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// DeviceInfoService deviceInfoService = DeviceInfoService();
// NotificationService _notificationService = NotificationService();

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   log("_handleBackgroundMessage notification ==>$message");
//   log("_handleBackgroundMessage notification data==>${message.data}");
//   log("_handleBackgroundMessage notification notification==>${message.notification}");
//   // if (message.notification != null) {
//   //   _notificationService.showLocalNotification(message);
//   // }
// }

// final GoRouter router = Routes.router;

// BuildContext? get routerContext =>
//     router.routerDelegate.navigatorKey.currentContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers
            .allProviders, // Created a seperate file to intialize all the providers
        child: KeyboardDismisser(
          child: MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            // locale: context.locale,
            navigatorKey: navigatorKey,
            // theme: AppTheme(context).lightTheme,
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          ),
        ));
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final SettingsService settingService = SettingsService();
    //   String? fcmToken;
    //   try {
    //     // if (Platform.isAndroid) {
    //     fcmToken = await FirebaseMessaging.instance.getToken();
    //     // } else {
    //     //   fcmToken = await FirebaseMessaging.instance.getAPNSToken();
    //     // }
    //   } catch (e) {
    //     log("e fcmToken==>$fcmToken");
    //   }
    //   await settingService.getDeviceInfo(fcmToken, MediaQuery.of(context).size);
    //   log("fcmToken====>$fcmToken");
    //   _notificationService.initNotification();
    //   // StoreDeviceId.setDeviceId(deviceInfoModel);
    // });
    super.initState();
  }
}
