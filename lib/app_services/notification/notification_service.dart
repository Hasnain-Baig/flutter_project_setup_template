// import 'dart:convert';
// import 'dart:math' hide log;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:developer';

// import '../../firebase_options.dart';
// import 'package:timezone/data/latest.dart' as tz;

// class NotificationService {
//   Future<void> init() async {
//     try {
//       await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       );
//     } catch (e) {
//       log("initiating firebase error===>${e.toString()}");
//     }
//   }

//   Future<void> initNotification() async {
//     try {
//       // Listen to Firebase messaging streams

//       // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//       handleInitialMessage();
//       FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
//       FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationClick);
//     } catch (e) {
//       log("initNotification e==>$e");
//     }
//   }

//   Future<void> handleInitialMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     log("handleInitialMessage==>$initialMessage");
//     log("handleInitialMessage==>${initialMessage?.data}");
//     log("handleInitialMessage==>${initialMessage?.notification}");

//     if (initialMessage != null) {
//       //handle initialMessage
//     }
//   }
//   // Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   //   // await init();
//   //   log("_handleBackgroundMessage notification ==>${message}");
//   //   log("_handleBackgroundMessage notification data==>${message.data}");
//   //   if (message.data.isNotEmpty) {
//   //     showLocalNotification(message);
//   //   }
//   //   // Map<String, dynamic> data = message.data;
//   //   // String type = data['type'];
//   // }

//   void _handleForegroundMessage(RemoteMessage message) {
//     log("_handleForegroundMessage notification ==>$message");
//     log("_handleForegroundMessage notification data==>${message.data}");
//     log("_handleForegroundMessage notification notification==>${message.notification}");
//     if (message.notification != null) {
//       showLocalNotification(message);
//     }
//   }

//   void _handleNotificationClick(RemoteMessage message) {
//     log("_handleNotificationClick notification ==>$message");
//     log("_handleNotificationClick notification data==>${message.data}");
//     log("_handleNotificationClick notification notification==>${message.notification}");
//   }

//   void showLocalNotification(RemoteMessage message) async {
//     try {
//       var rng = Random();
//       final flutterLocalNotificationsPlugin =
//           await setupFlutterLocalNotification();
//       // log("handleNotification==>$message");
//       // log("handleNotification messagedta==>${message.data}");
//       flutterLocalNotificationsPlugin.show(
//           rng.nextInt(1),
//           message.notification?.title ?? "",
//           message.notification?.body ?? "",
//           const NotificationDetails(
//               android: AndroidNotificationDetails(
//                 'new_message',
//                 'New message notifications channel',
//                 importance: Importance.max,
//                 playSound: true,
//                 showProgress: true,
//                 priority: Priority.high,
//               ),
//               iOS: DarwinNotificationDetails()),
//           payload: jsonEncode({"msg_body": message.notification?.body ?? ""}));
//     } catch (e) {
//       log("SETUP handleNotification error=====>${e.toString()}");
//     }
//   }

//   Future<FlutterLocalNotificationsPlugin>
//       setupFlutterLocalNotification() async {
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     tz.initializeTimeZones();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@drawable/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS,
//             macOS: null);

//     tz.initializeTimeZones(); // <------

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: selectNotification,
//       onDidReceiveBackgroundNotificationResponse: selectNotification,
//     );

//     return flutterLocalNotificationsPlugin;
//   }

//   @pragma('vm:entry-point')
//   static void selectNotification(NotificationResponse details) {
//     log("selectNotification==<${details}");
//     log("selectNotification==<${details.payload}");
//   }
// }
