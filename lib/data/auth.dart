import 'dart:convert';

String getSession(userId, sessionToken) {
  var sessionData = {
    "user_id": userId,
    "session_token": sessionToken
  };
  var sessionRaw = jsonEncode(sessionData).toString();
  var sessionEncoded = base64.encode(utf8.encode(sessionRaw));
  return sessionEncoded;
}