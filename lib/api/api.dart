import 'package:dio/dio.dart';
import 'package:nekoya_flutter/api/config.dart';

Future<dynamic> getProducts() async {
  var req = await Dio().get('$host/getproducts');
  var res = req.data;
  return res;
}

Future<dynamic> getProduct(id) async {
  var req = await Dio().get('$host/getproduct', queryParameters: {'id': id});
  var res = req.data;
  return res;
}

Future<dynamic> registerPost(data) async {
  Response req = await Dio().post(
    ('$host/register'),
    data: data,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
  return req.statusCode;
}

Future<dynamic> loginPost(data) async {
  Response req = await Dio().post(
    ('$host/login'),
    data: data,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 400;
      },
    ),
  );
  return {'statusCode': req.statusCode, 'data': req.data};
}

Future<dynamic> resetPost(data) async {
  Response req = await Dio().post(
    ('$host/request-reset-password'),
    data: data,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 400;
      },
    ),
  );
  return {'statusCode': req.statusCode, 'data': req.data};
}

Future<dynamic> getSessions(session) async {
  var req = await Dio()
      .post('$host/sessions', queryParameters: {'session_token': session});
  return {'statusCode': req.statusCode, 'data': req.data};
}

Future<dynamic> getTransactions(session) async {
  var req = await Dio()
      .post('$host/transaction', queryParameters: {'session_token': session});
  var res = req.data;
  return res;
}

Future<dynamic> checkoutPost(session, data) async {
  Response req = await Dio().post(
    ('$host/checkout'),
    queryParameters: {'session_token': session},
    data: data,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
  return req.statusCode;
}
