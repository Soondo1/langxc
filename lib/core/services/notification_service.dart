// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../services/backend_api_service.dart';
import '../services/auth_service.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // Feature Flag - Toggle this when Firebase is ready
  static const bool kFirebaseEnabled = false;

  // ignore: unused_field
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final BackendApiService _backendService = BackendApiService();
  final AuthService _authService = AuthService();

  String? _fcmToken;

  // Navigation callback to be set by the app
  void Function(String routeName, Map<String, String> queryParams)? navigateTo;

  String? get fcmToken => _fcmToken;

  Future<void> initialize() async {
    if (!kFirebaseEnabled) {
      if (kDebugMode) {
        print('NotificationService initialized (Firebase disabled)');
      }
      return;
    }

    /* 
     * Firebase Initialization Logic
     * Uncomment and enable kFirebaseEnabled when ready
     */
    // ... Implementation preserved in git history ...
  }

  // ignore: unused_element
  Future<void> _sendTokenToBackend() async {
    if (_fcmToken != null && _authService.currentUser != null) {
      try {
        await _backendService.updateFcmToken(_fcmToken!);
        if (kDebugMode) {
          print('FCM token sent to backend successfully');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Failed to send FCM token to backend: $e');
        }
      }
    }
  }

  Future<dynamic> getNotificationSettings() async {
    return null;
  }

  Future<void> refreshToken() async {
    // Stub
  }
}
