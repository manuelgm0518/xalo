import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xalo/components/dialogs/error_dialog.dart';
//import 'package:http/http.dart' as http;

class FirebaseService extends GetxController {
  static FirebaseService get to => Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getFrom(String path, {String error, bool showError = false}) async {
    try {
      final result = await firestore.doc(path).get();
      if (result != null) return {'id': result.id, ...result.data()};
      throw "No se pudo encontrar la información solicitada.";
    } catch (e) {
      print('[FIRESTORE GET ERROR]: $e');
      if (showError) await ErrorDialog(error: error, description: e.toString()).show();
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWhere(String collection, Query Function(CollectionReference) query, {int limit, String error, bool showError = false}) async {
    try {
      final reference = firestore.collection(collection);
      final results = await (limit != null ? query(reference) : query(reference).limit(limit)).get();
      if (results != null) {
        var docs = <Map<String, dynamic>>[];
        for (final doc in results.docs) docs.add({'id': doc.id, ...doc.data()});
        return docs;
      }
      throw "No se pudo encontrar la información solicitada.";
    } catch (e) {
      print('[FIRESTORE QUERY ERROR]: $e');
      if (showError) await ErrorDialog(error: error, description: e.toString()).show();
      return null;
    }
  }

  Stream<DocumentSnapshot> getStream(String path, {String error, bool showError = false}) {
    try {
      final results = firestore.doc(path).snapshots();
      if (results != null) return results;
      throw "No se pudo encontrar la información solicitada.";
    } catch (e) {
      print('[FIRESTORE STREAM ERROR]: $e');
      if (showError) ErrorDialog(error: error, description: e.toString()).show();
      return null;
    }
  }

  Stream<QuerySnapshot> getStreamWhere(String collection, Query Function(CollectionReference) query, {int limit, String error, bool showError = false}) {
    try {
      final reference = firestore.collection(collection);
      final results = (limit != null ? query(reference) : query(reference).limit(limit)).snapshots();
      if (results != null) return results;
      throw "No se pudo encontrar la información solicitada.";
    } catch (e) {
      print('[FIRESTORE STREAM QUERY ERROR]: $e');
      if (showError) ErrorDialog(error: error, description: e.toString()).show();
      return null;
    }
  }

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
