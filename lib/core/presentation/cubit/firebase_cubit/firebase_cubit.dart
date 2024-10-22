import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';

part 'firebase_state.dart';

// This should be a global method to be able to be called in background
Future<void> onMessageOpenApp(RemoteMessage message) async {
  debugPrint('Message clicked!');
}

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(const FirebaseState(status: FirebaseStatus.initial)) {
    setup();
  }

  Future<void> setup() async {
    configureCloudMessaging();
    sendFCMTokenIfLoggedIn();
    configureCrashlytics();
    configureAnalytics();
  }

  late FirebaseMessaging messaging;

  void configureCloudMessaging() {
    messaging = FirebaseMessaging.instance;
    askNotificationPermission();
    getFCMToken();
    onFcmTokenRefresh();
    enableForegroundNotifications();
    listenToMessages();
  }

  void enableForegroundNotifications() {
    messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  void onFcmTokenRefresh() {
    messaging.onTokenRefresh.listen((token) async {
      _latestToken = token;
      emit(state.copyWith(
        fcmToken: token,
      ));
      debugPrint("FCMToken=$token");
      sendFCMTokenIfLoggedIn(token: token);
    });
  }

  void listenToMessages() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenApp);
    messaging.getInitialMessage().then((message) {
      if (message != null) {
        onMessageOpenApp(message);
      }
    });
  }

  void configureAnalytics() async {
    // TODO: Add user id for Analytics later
    // await FirebaseAnalytics.instance.setUserId(
    //   id: "",
    // );

    FirebaseAnalytics.instance.logAppOpen();
  }

  Future<void> askNotificationPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> configureCrashlytics() async {
    // TODO: Add user id for crashlytics later
    // FirebaseCrashlytics.instance.setUserIdentifier("");
  }

  String? _latestToken;

  void sendFCMTokenIfLoggedIn({String? token}) async {
    // TODO: send fcm token to server here
  }

  void getFCMToken() async {
    final token = await messaging.getToken();
    emit(state.copyWith(fcmToken: token));
    debugPrint("FCMToken=$token");
  }
}
