import 'dart:convert';
import 'package:hive/hive.dart';

import 'package:nekoya_app/api/api.dart';

String getEncodedSession(userId, sessionToken) {
  var sessionData = {"user_id": userId, "session_token": sessionToken};
  var sessionRaw = jsonEncode(sessionData).toString();
  var sessionEncoded = base64.encode(utf8.encode(sessionRaw));
  return sessionEncoded;
}

Future<void> addSession(userId, sessionToken) async {
  final box = Hive.box();

  String session = getEncodedSession(userId, sessionToken);

  box.put('session', session);
}

Future<bool> checkSessionExist() async {
  final box = Hive.box();

  if (box.get('session') != null) {
    var res = await getSessions(await getSession());

    if (res['statusCode'] == 200) {
      return true;
    } else {
      removeSession();
      return false;
    }
  }

  return false;
}

Future<String> getSession() async {
  final box = Hive.box();

  if (box.get('session') != null) {
    return box.get('session', defaultValue: 'null');
  }

  return 'null';
}

Future<void> removeSession() async {
  final box = Hive.box();

  box.delete('session');
}
