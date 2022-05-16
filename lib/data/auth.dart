import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nekoya_flutter/api/api.dart';

String getEncodedSession(userId, sessionToken) {
  var sessionData = {
    "user_id": userId,
    "session_token": sessionToken
  };
  var sessionRaw = jsonEncode(sessionData).toString();
  var sessionEncoded = base64.encode(utf8.encode(sessionRaw));
  return sessionEncoded;
}

Future<void> addSession(userId, sessionToken) async {
  final prefs = await SharedPreferences.getInstance();

  String session = getEncodedSession(userId, sessionToken);

  await prefs.setString('session', session);
}

Future<bool> checkSessionExist() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('session')) {
    var res = await getSessions(await getSession());

    if (res['statusCode'] == 200) {
      return true;
    }
    removeSession();
    return false;
  }

  return false;
}

Future<String> getSession() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('session')) {
    return prefs.getString('session') ?? 'null';
  }

  return 'null';
}

Future<void> removeSession() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.remove('session');
}