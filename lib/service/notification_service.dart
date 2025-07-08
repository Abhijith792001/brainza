import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Android-specific initialization
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('ic_stat_notification'); // ✅ use proper icon

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(initSettings);

    // Request notification permissions
    await _messaging.requestPermission();

    // Get and print FCM token
    String? token = await _messaging.getToken();
    print("FCM Token: $token");

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'default_channel',
              'Default Channel',
              channelDescription: 'For default notifications',
              importance: Importance.high,
              priority: Priority.high,
              icon: 'ic_stat_notification', // ✅ use custom white icon here
            ),
          ),
        );
      }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    // Handle background notification logic here if needed
  }
}
