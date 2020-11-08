import 'dart:convert';
import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FirebaseService extends GetxController {
  static FirebaseService get to => Get.find();
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /*final FirebaseMessaging messaging = FirebaseMessaging();
  final FirebaseStorage storage = FirebaseStorage.instance;

  static Future<dynamic> _backgroundMessageHandler(Map<String, dynamic> message) async {
    print("[FIREBASE MESSAGING] onBackgroundMessage: $message");
  }

  static Future<dynamic> _messageHandler(Map<String, dynamic> message) async {
    Get.snackbar(
      message['notification']['title'].toString(),
      message['notification']['body'].toString(),
    );
    print("[FIREBASE MESSAGING] onMessage: $message");
  }

  static Future<dynamic> _launchHandler(Map<String, dynamic> message) async {
    print("[FIREBASE MESSAGING] onLaunch: $message");
  }

  static Future<dynamic> _resumeHandler(Map<String, dynamic> message) async {
    print("[FIREBASE MESSAGING] onResume: $message");
  }

  Future<void> _initMessaging() async {
    if (Platform.isIOS) messaging.requestNotificationPermissions(IosNotificationSettings());
    messaging.configure(
      onBackgroundMessage: _backgroundMessageHandler,
      onMessage: _messageHandler,
      onLaunch: _launchHandler,
      onResume: _resumeHandler,
    );
    messagingToken = await messaging.getToken();
    print("FirebaseMessaging token: $messagingToken");
  }

  final String serverToken = 'AAAAyoRSGaE:APA91bHpEfYRjesIVXoindQgkj-P-vmONfYFFmn-DW4lk3WdqlFJ9MrrMU3EAAYRZyl_3R1vOux9sqZN0HfVjcfxdOvwQeMIjNWrUCU4FT2ob_DN5Y9QNQ21DxPj2pfLQVcbaSxo5SGv';
  String messagingToken;

  void sendMessage({String title, String body, List<String> tokens, String screen = '/', String userType = 'none'}) async {
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{'Content-Type': 'application/json', 'Authorization': 'key=$serverToken'},
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': body, 'title': title},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
          'registration_ids': tokens
        },
      ),
    );
  }

  @override
  void onInit() {
    _initMessaging();
    super.onInit();
  }*/
}
